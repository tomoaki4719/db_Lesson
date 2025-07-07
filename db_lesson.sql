-- Q1
CREATE TABLE departments(
    -> department_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(20) NOT NULL,
    -> created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -> updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    -> );

-- Q2
ALTER TABLE people ADD COLUMN department_id INT UNSIGNED AFTER email;

-- Q3
-- 追加する部署一覧(departments)
INSERT INTO departments (name)
    -> VALUES
    -> ('営業'),
    -> ('開発'),
    -> ('経理'),
    -> ('人事'),
    -> ('情報システム');
-- 追加する人の条件(people)
INSERT INTO people (person_id, name)
    -> VALUES
    -> ('4', '山本けんたろう'),
    -> ('7', '矢野ちひろ'),
    -> ('8', '佐藤あきら'),
    -> ('9', '加藤まほ'),
    -> ('10', '遠藤ようへい');
UPDATE people
SET age = CASE person_id
  WHEN person_id = 4 THEN '18'
  WHEN person_id = 5 THEN '22'
  WHEN person_id = 7 THEN '35'
  WHEN person_id = 8 THEN '48'
  WHEN person_id = 9 THEN '60'
  WHEN person_id = 10 THEN '51'
END
WHERE person_id IN (person_id = 4, person_id = 6, person_id = 7, person_id = 8, person_id = 9, person_id = 10);
UPDATE people SET age = '18' WHERE person_id = 4;
UPDATE people SET age = '22' WHERE person_id = 5;
UPDATE people SET age = '35' WHERE person_id = 7;
UPDATE people SET age = '48' WHERE person_id = 8;
UPDATE people SET age = '60' WHERE person_id = 9;
UPDATE people SET age = '51' WHERE person_id = 10;
UPDATE people SET gender = '1' WHERE person_id = 4;
UPDATE people SET gender = '2' WHERE person_id = 5;
UPDATE people SET gender = '2' WHERE person_id = 7;
UPDATE people SET gender = '1' WHERE person_id = 8;
UPDATE people SET gender = '2' WHERE person_id = 9;
UPDATE people SET gender = '1' WHERE person_id = 10;
-- 追加する日報の条件(reports)
INSERT INTO reports (person_id, content) VALUES
  -> (4, 'Report from 山本けんたろう - 1'),
  -> (4, 'Report from 山本けんたろう - 2'),
  -> (7, 'Report from 矢野ちひろ - 1'),
  -> (7, 'Report from 矢野ちひろ - 2'),
  -> (7, 'Report from 矢野ちひろ - 3'),
  -> (7, 'Report from 矢野ちひろ - 4'),
  -> (8, 'Report from 佐藤あきら - 1'),
  -> (9, 'Report from 加藤まほ - 1'),
  -> (10, 'Report from 遠藤ようへい - 1'),
  -> (10, 'Report from 遠藤ようへい - 2');

-- Q4
UPDATE people SET department_id = '1' WHERE person_id = 1;
UPDATE people SET department_id = '1' WHERE person_id = 2;
UPDATE people SET department_id = '1' WHERE person_id = 3;
UPDATE people SET department_id = '2' WHERE person_id = 4;
UPDATE people SET department_id = '2' WHERE person_id = 5;
UPDATE people SET department_id = '2' WHERE person_id = 6;
UPDATE people SET department_id = '2' WHERE person_id = 7;
UPDATE people SET department_id = '3' WHERE person_id = 8;
UPDATE people SET department_id = '4' WHERE person_id = 9;
UPDATE people SET department_id = '5' WHERE person_id = 10;

-- Q5
SELECT name, gender, age
FROM people
WHERE gender = 1
ORDER BY age DESC;

-- Q6
peopleテーブルの中のdepartment_idカラムの値が1のレコードを対象に、
name、email、ageのカラムから値を取得しています。
取得レコードはcreated_atの昇順で並べ替えています。

-- Q7
SELECT name, gender, age
FROM people
WHERE
  (gender = 2 AND age BETWEEN 20 AND 29)
  OR
  (gender = 1 AND age BETWEEN 40 AND 49);

-- Q8
SELECT name, department_id, age
FROM people
WHERE department_id = '1'
ORDER BY age ASC;

-- Q9
SELECT AVG(age) AS average_age
FROM people
WHERE department_id = '2' AND gender = 2;

-- Q10
SELECT p.name, p.department_id, r.content
FROM people p
INNER JOIN reports r
ON p.person_id = r.person_id;

-- Q11
SELECT p.name
FROM people p
LEFT JOIN reports r ON p.person_id = r.person_id
WHERE r.report_id IS NULL;










