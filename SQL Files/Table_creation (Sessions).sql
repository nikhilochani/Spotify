CREATE TABLE session_data (
    session_id VARCHAR(255) PRIMARY KEY, -- Unique session identifier (date + session_number)
    session_number INT, -- Incremental session counter
    start_time TIMESTAMP, -- Timestamp when the session started
    end_time TIMESTAMP, -- Timestamp when the session ended
    total_tracks INT, -- Total tracks played in this session
    session_duration INT, -- Total time spent in the session (ms_played)
    day_of_week VARCHAR(10), -- Day of the week (Monday-Sunday)
    start_hour INT, -- Hour of the day when session started (0-23)
    end_hour INT, -- Hour of the day when session ended (0-23)
    time_of_day VARCHAR(20), -- Morning, Afternoon, Evening, Night, Late Night
    shuffle_percentage DECIMAL(5,2), -- % of tracks played on shuffle
    skip_rate DECIMAL(5,2), -- Skipped tracks / total tracks
    completion_rate DECIMAL(5,2), -- Tracks completed (trackdone) / total tracks
    session_type VARCHAR(10), -- Short, Medium, Long (based on duration thresholds)
    track_completion_status VARCHAR(10), -- Completed, Skipped (based on reason_end)
    interrupted_session BOOLEAN, -- TRUE if session ended unexpectedly (logout, trackerror, etc.)
    device_category VARCHAR(50), -- Mobile, Desktop, Web, Speaker, or "Multiple"
    repeat_listens_within_session INT, -- Count of repeat tracks in the session
    new_song_discovery INT, -- Count of newly discovered songs
    new_artist_discovery INT, -- Count of newly discovered artists
    discovery_rate DECIMAL(5,2), -- % of new songs discovered in session
    skip_spree_count INT, -- Count of 3+ consecutive skips within 10 sec
    avg_pause_gap DECIMAL(10,2) -- Average time between track plays (in seconds)
);
