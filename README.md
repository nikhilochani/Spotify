# Spotify Listening Behavior Analysis  

## 1. Background and Overview  

### Why This Project?  
Spotify is the most used app on my phone, running in the background for a significant portion of my day. When I discovered that **Spotify allows users to download their streaming history**, I saw an opportunity to analyze my own listening behavior and apply **structured product analytics methodologies** to derive insights.  

### Project Scope  
This project aims to analyze personal music streaming behavior through **data analytics, SQL processing, and visualization techniques**. The analysis is structured into two key areas:  

- **Session Analysis** – Understanding listening habits across **time of day, session duration, and engagement patterns**.  
- **Feature Analysis** – Evaluating **music discovery, shuffle impact, and playback behavior**.  

The goal is to align findings with **real-world streaming KPIs**, providing insights into **engagement trends, discovery effectiveness, and user behavior patterns**.

---

## 2. Data Structure  

The dataset is structured in a **relational schema** with two key tables:  
- **StreamingHistory** – Raw track-level listening data, containing timestamps, playback events, feature usage, and session association.  
- **Session_data** – Aggregated session-level data, calculating key engagement metrics per listening session.  
**Relationship:** One-to-Many (`session_number` in `Session_data` → `session_number` in `StreamingHistory`).

### **Entity-Relationship Diagram**  

![Spotify Data Structure](https://github.com/nikhilochani/Spotify/blob/main/Files/Spotify%20Data%20Structure.png?raw=true)

---

## 3. Executive Summary  

### **Key Business Questions**  
- How does listening behavior vary across different times of the day and week?  
- What factors drive engagement, including shuffle, skips, and repeat listens?  
- How frequently do I discover new songs or artists, and what influences discovery?  
- How do different devices and platforms impact listening habits?  

### **Metrics & KPIs**  

The project focuses on **core engagement and discovery metrics** aligned with industry standards:  

#### **Engagement Metrics**  
- **Session Duration** – Total listening time per session.  
- **Skip Rate** – Percentage of skipped tracks.  
- **Completion Rate** – Percentage of fully played tracks.  
- **Shuffle Usage** – Proportion of tracks played with shuffle enabled.  
- **Repeat Listen Rate** – Frequency of track replays within a session.  

#### **Discovery Metrics**  
- **New Song Discovery Rate** – Percentage of newly played tracks per session.  
- **New Artist Discovery Rate** – First-time listens to an artist.  
- **Track Completion Status** – Whether tracks are completed or skipped.  

#### **Behavioral Insights**  
- **Listening Patterns** – Engagement trends across different time segments.  
- **Skip Spree Events** – Identifying frequent consecutive skips within a session.  
- **Platform Influence** – Analyzing engagement differences across mobile, desktop, and speakers.  

---

## 4. Next Steps and Ongoing Analysis  

This project is still in progress, with key analyses underway. The next phase involves refining the dataset, conducting in-depth exploratory analysis, and visualizing findings through **interactive dashboards**.  

### **Next Steps:**  
✔️ **Building Tableau dashboards** to visualize key engagement trends.  
✔️ **Deep-diving into feature engagement**, including shuffle, autoplay, and offline listening.  
✔️ **Benchmarking insights against industry streaming KPIs.**  
✔️ **Identifying key behavioral trends for future predictive modeling.**  

Findings and insights will be updated as the analysis progresses.  
