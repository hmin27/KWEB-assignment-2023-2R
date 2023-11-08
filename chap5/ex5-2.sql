-- Code A.5 import(stations, types, trains, users, tickets)
-- Code A.6 import(모든 테이블)

-- 1
SELECT `users`.`id`, `users`.`name`, `tickets`.`seat_number` FROM `tickets`
INNER JOIN `users` ON `users`.`id` = `tickets`.`user` 
AND `tickets`.`train` = 11 ORDER BY `tickets`.`seat_number`;
-- 좌석 번호 오름차순 정렬(default)


-- 2
SELECT `users`.`id`, `users`.`name`, Count(*) AS `trains_count`,
Sum(`trains`.`distance`) / 10 AS `total_distance`
FROM `tickets`
INNER JOIN `trains` ON `trains`.`id` = `tickets`.`train`
INNER JOIN `users` ON `users`.`id` = `tickets`.`user`
GROUP BY `users`.`id`
ORDER BY `total_distance` DESC
LIMIT 6; -- 내림차순 정렬, 상위 6명 제한


-- 3
SELECT `trains`.`id`, `types`.`name` AS `type`, `src`.`name` AS `src_stn`,
`dst`.`name` AS `dst_stn`, Timediff(`arrival`, `departure`) AS `travel_time`  --시간 차이 계산
FROM `trains`
INNER JOIN `types` ON `types`.`id` = `trains`.`type`
INNER JOIN `stations` AS `src` ON `src`.`id` = `trains`.`source`
INNER JOIN `stations` AS `dst` ON `dst`.`id` = `trains`.`destination`
ORDER BY `travel_time` DESC
LIMIT 6;


-- 4
SELECT `types`.`name` AS `type`, `src`.`name` AS `src_stn`,
`dst`.`name` AS `dst_stn`, `trains`.`departure`, `trains`.`arrival`,
Round(`types`.`fare_rate` * `trains`.`distance` / 1000, -2) as `fare`
-- 두 자리수까지 반올림(Round( ,-2))
FROM `trains`
INNER JOIN `types` ON `types`.`id` = `trains`.`type`
INNER JOIN `stations` AS `src` ON `src`.`id` = `trains`.`source`
INNER JOIN `stations` AS `dst` ON `dst`.`id` = `trains`.`destination`
ORDER BY `departure`;


-- 5
SELECT `trains`.`id`, `types`.`name` AS `type`,
`src`.`name` AS `src_stn`, `dst`.`name` AS `dst_stn`,
Count(*) AS `occupied`, `types`.`max_seats` AS `maximum`
FROM `tickets`
INNER JOIN `trains` ON `trains`.`id` = `tickets`.`train` --사용자 있는 노선만 포함
INNER JOIN `types` ON `types`.`id` = `trains`.`type`
INNER JOIN `stations` AS `src` ON `src`.`id` = `trains`.`source`
INNER JOIN `stations` AS `dst` ON `dst`.`id` = `trains`.`destination`
GROUP BY `tickets`.`train`
ORDER BY `trains`.`id`;


-- 6
SELECT `trains`.`id`, `types`.`name` AS `type`,
`src`.`name` AS `src_stn`, `dst`.`name` AS `dst_stn`,
Count(`tickets`.`id`) AS `occupied`, `types`.`max_seats` AS `maximum`
FROM `tickets`
RIGHT JOIN `trains` ON `trains`.`id` = `tickets`.`train` -- Right Join으로 사용자 없는 노선 포함
INNER JOIN `types` ON `types`.`id` = `trains`.`type`
INNER JOIN `stations` AS `src` ON `src`.`id` = `trains`.`source`
INNER JOIN `stations` AS `dst` ON `dst`.`id` = `trains`.`destination`
GROUP BY `tickets`.`train`
ORDER BY `trains`.`id`;