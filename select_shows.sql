-- Show all the movies running in a particular theater on a particular date
SELECT 
    t.name AS `Theatre`, 
    t.location AS `Location`, 
    m.title AS `Movie`, 
    sc.screen_id AS `Screen`,
    s.show_date AS `Show Date`, 
    s.start_time AS `Start Time`
FROM `Show` AS s
INNER JOIN Screen AS sc ON s.screen_id = sc.screen_id
INNER JOIN Theatre AS t ON t.theatre_id = sc.theatre_id
INNER JOIN Movie AS m ON m.movie_id = s.movie_id
WHERE s.show_date = '2025-05-24' AND t.name = 'PVR Inox';