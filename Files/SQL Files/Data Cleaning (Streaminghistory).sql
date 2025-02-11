-- Date Cleaning
--Create it as a stored procedure

Select column_Name, data_type,columns,data_type
from information_schema.columns
where table_name ='streaminghistory';


Alter Table streaminghistory RENAME COLUMN master_metadata_track_name to track_name;
Alter Table streaminghistory RENAME COLUMN master_metadata_album_artist_name to artist_name;
Alter Table streaminghistory RENAME COLUMN master_metadata_album_album_name to album_name;


Alter table streaminghistory
Add column ts_updated timestamp without time zone;

--Updating time zones based on my travel history, to give accurate results for time of day analysis
UPDATE Streaminghistory 
SET ts_updated =
CASE
    WHEN ts::DATE < '2023-07-05' THEN (ts AT TIME ZONE 'UTC') AT TIME ZONE 'America/Los_Angeles' -- PST/PDT
    WHEN ts::DATE BETWEEN '2023-07-05' AND '2023-08-30' THEN (ts AT TIME ZONE 'UTC') AT TIME ZONE 'America/Denver' -- MST/MDT
    WHEN ts::DATE BETWEEN '2023-08-31' AND '2024-09-13' THEN (ts AT TIME ZONE 'UTC') AT TIME ZONE 'America/Los_Angeles' -- PST/PDT
    WHEN ts::DATE BETWEEN '2023-12-08' AND '2024-01-12' THEN (ts AT TIME ZONE 'UTC') AT TIME ZONE 'Asia/Kolkata' -- IST (Fixed, no DST)
    WHEN ts::DATE >= '2024-09-14' THEN (ts AT TIME ZONE 'UTC') AT TIME ZONE 'America/Denver' -- MST/MDT
END;


ALTER TABLE streaminghistory 
ADD COLUMN session_number int;

ALTER TABLE streaminghistory 
ADD COLUMN session_number_without_partition int;


ALTER TABLE streaminghistory ADD COLUMN row_id BIGINT;
--Updating unique id for each row based
UPDATE streaminghistory s
SET row_id = sub.ordered_row
FROM (
    SELECT 
        ctid, --a system column that uniquely identifies rows in Postgresql
        ROW_NUMBER() OVER (ORDER BY ts_updated, ms_played) AS ordered_row
    FROM streaminghistory
) sub
WHERE s.ctid = sub.ctid;



--Session logic	
With session_count as
	(Select
		ts_updated,
		row_number() over(order by ts_updated) as row_id_1,
		Case 
			WHEN
			lag(ts_updated) over(partition by date(ts_updated) order by ts_updated) is NULL then 1
			when ts_updated - lag(ts_updated) over(partition by date(ts_updated) order by ts_updated) > interval '30 minutes' Then 1
			ELSE 0
		END as session_count
	from streaminghistory s
),session_group as
(
	Select
	*,
	sum(session_count) over(partition by date(s.ts_updated) order by s.ts_updated) as session_group
	from session_count s
)
UPDATE streaminghistory
SET session_number = s.session_group
					from session_group s
					where s.ts_updated=streaminghistory.ts_updated
					and s.row_id_1=streaminghistory.row_id

					
--Date validation for session assignments

WITH session_check AS (
    SELECT 
        ts_updated,
        DATE(ts_updated) AS session_date,
        session_number,
        LAG(ts_updated) OVER(PARTITION BY DATE(ts_updated), session_number ORDER BY ts_updated) AS prev_ts,
        EXTRACT(EPOCH FROM (ts_updated - LAG(ts_updated) OVER(PARTITION BY DATE(ts_updated), session_number ORDER BY ts_updated))) / 60 AS time_diff_minutes
    FROM streaminghistory
)
SELECT * 
FROM session_check
WHERE time_diff_minutes > 30  -- Sessions should not have gaps over 30 min
   OR session_date != DATE(prev_ts); -- Sessions should not span multiple days




