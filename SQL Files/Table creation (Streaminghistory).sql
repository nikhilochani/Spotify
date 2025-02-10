CREATE TABLE Streaminghistory (
    ts TIMESTAMP NOT NULL, -- Timestamp of the event
    platform VARCHAR(255), -- Platform used (e.g., android, iOS, etc.)
    ms_played INT, -- Milliseconds played
    conn_country VARCHAR(255), -- Country code (e.g., US)
    ip_addr VARCHAR(255), -- IP address
    master_metadata_album_track_name VARCHAR(255), -- Name of the track
    master_metadata_album_artist_name VARCHAR(255), -- Artist name
    master_metadata_album_name VARCHAR(255), -- Album name
    spotify_track_uri VARCHAR(255), -- Spotify URI of the track
    episode_name VARCHAR(255), -- Name of the episode
    episode_show_name VARCHAR(255), -- Show name
    spotify_episode_uri VARCHAR(255), -- Spotify URI of the episode
    audiobook_title VARCHAR(255), -- Title of the audiobook
    audiobook_uri VARCHAR(255), -- URI of the audiobook
    audiobook_chapter_uri VARCHAR(255), -- URI of the audiobook chapter
    audiobook_chapter_title VARCHAR(255), -- Title of the audiobook chapter
    reason_start VARCHAR(255), -- Reason the playback started
    reason_end VARCHAR(255), -- Reason the playback ended
    shuffle BOOLEAN, -- Whether shuffle was enabled
    skipped BOOLEAN, -- Whether the track was skipped
    offline BOOLEAN, -- Whether it was played offline
    offline_timestamp BIGINT,
    incognito_mode BOOLEAN -- Whether incognito mode was used
);
