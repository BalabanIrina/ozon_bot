CREATE TABLE IF NOT EXISTS student (
    id_student INTEGER NULL,
    s_name VARCHAR(50) NULL,
    s_year INTEGER NULL,
    s_status VARCHAR(10) NULL,
    s_group VARCHAR(10) NULL,
    PRIMARY KEY (id_student)
);

CREATE TABLE IF NOT EXISTS course (
    id_course INTEGER NULL,
    c_name VARCHAR(50) NULL,
    c_semester INTEGER NULL,
    c_formula VARCHAR(100),
    PRIMARY KEY (id_course)
);

CREATE TABLE IF NOT EXISTS work (
    id_work INTEGER NULL,
    id_course INTEGER NULL,
    w_name VARCHAR(50) NULL,
    w_deadline DATETIME,
    w_weight FLOAT,
    PRIMARY KEY (id_work),
    FOREIGN KEY (id_course) REFERENCES course(id_course) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS student_course (
    id_student INTEGER NULL,
    id_course INTEGER NULL,
    PRIMARY KEY (id_student, id_course),
    FOREIGN KEY (id_student) REFERENCES student(id_student) ON UPDATE CASCADE,
    FOREIGN KEY (id_course) REFERENCES course(id_course) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS student_work (
    id_student INTEGER NULL,
    id_work INTEGER NULL,
    grade REAL NULL,
    PRIMARY KEY (id_student, id_work),
    FOREIGN KEY (id_student) REFERENCES student(id_student) ON UPDATE CASCADE,
    FOREIGN KEY (id_work) REFERENCES work(id_work) ON UPDATE CASCADE
);



INSERT INTO work (id_work, id_course, w_name, w_deadline, w_weight) VALUES (943991, 1755, 'hw1', NULL, NULL);
INSERT INTO work (id_work, id_course, w_name, w_deadline, w_weight) VALUES (421152, 1974, 'hw1', NULL, NULL);
INSERT INTO work (id_work, id_course, w_name, w_deadline, w_weight) VALUES (280501, 5006, 'hw1', NULL, NULL);
INSERT INTO work (id_work, id_course, w_name, w_deadline, w_weight) VALUES (827636, 5286, 'hw1', NULL, NULL);
INSERT INTO work (id_work, id_course, w_name, w_deadline, w_weight) VALUES (402170, 6317, 'hw1', NULL, NULL);
INSERT INTO work (id_work, id_course, w_name, w_deadline, w_weight) VALUES (830610, 9472, 'hw1', NULL, NULL);
INSERT INTO work (id_work, id_course, w_name, w_deadline, w_weight) VALUES (154819, 9518, 'hw1', NULL, NULL);


INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (95929, 'abroskin', 2019, 'student', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (57790, 'antonov', 2019, 'student', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (71948, 'astakhov', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (11350, 'bagrova', 2019, 'sab', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (13859, 'baskakov', 2019, 'student', 'DS2');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (91531, 'belozerova', 2019, 'sab', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (26910, 'bileva', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (42574, 'boyko', 2019, 'sab', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (81697, 'bondarev', 2019, 'student', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (50342, 'butenko', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (22853, 'vaganova', 2019, 'wasted', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (51571, 'vasilieva', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (38807, 'voshchinina', 2019, 'student', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (68451, 'grigoriev', 2019, 'sab', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (29122, 'gabdushev', 2019, 'student', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (66802, 'guseva', 2019, 'sab', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (24259, 'davletov', 2019, 'student', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (22241, 'donskova', 2019, 'student', 'DS2');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (97899, 'ermolaev', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (38129, 'shziboedova', 2019, 'sab', 'DS2');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (38556, 'shzirnov', 2019, 'sab', 'DS2');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (33109, 'shziyanov', 2019, 'sab', 'DS2');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (38312, 'zabrodina', 2019, 'student', 'DS2');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (88783, 'ivolgina', 2019, 'student', 'DS2');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (77751, 'ismailov', 2019, 'sab', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (16998, 'kayumov', 2019, 'sab', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (52249, 'kiranov', 2019, 'sab', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (74528, 'koshzimyak', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (63541, 'kozub', 2019, 'sab', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (31476, 'komatovskiy', 2019, 'student', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (97605, 'korenev', 2019, 'wasted', 'DS2');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (33059, 'kosarev', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (87484, 'kochenov', 2019, 'student', 'DS2');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (30989, 'krasnov', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (40339, 'kruglikova', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (32030, 'kruchkov', 2019, 'sab', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (82845, 'kuzmin', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (11528, 'kupriyanova', 2019, 'student', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (22594, 'lazeev', 2019, 'student', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (87827, 'lemesheva', 2019, 'student', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (95108, 'lukyanchenko', 2019, 'student', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (25601, 'mamaev', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (75159, 'matveeva', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (77650, 'matrosov', 2019, 'student', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (12327, 'miroshnik', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (95339, 'mikhalev', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (99167, 'moiseenkov', 2019, 'sab', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (67621, 'nasedkin', 2019, 'wasted', 'DS2');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (29868, 'nikolayev', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (34795, 'nurlybay', 2019, 'student', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (51849, 'osinovskov', 2019, 'sab', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (29273, 'oshmarina', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (68204, 'platonov', 2019, 'sab', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (61370, 'polovnikov', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (40041, 'pronichkin', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (60661, 'pushkareva', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (25581, 'pezyapkin', 2019, 'wasted', 'DS2');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (42029, 'ryabszev', 2019, 'wasted', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (13657, 'samorszev', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (57258, 'safin', 2019, 'sab', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (49512, 'severinov', 2019, 'wasted', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (19757, 'selezneva', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (54380, 'selniszkiy', 2019, 'wasted', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (62553, 'selyakin', 2019, 'student', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (22139, 'serov', 2019, 'student', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (24138, 'smorchkov', 2019, 'student', 'DS2');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (43461, 'sotskov', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (67792, 'strunov', 2019, 'student', 'DS2');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (98588, 'trankova', 2019, 'student', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (95263, 'fateev', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (44575, 'fedotov', 2019, 'student', 'BI');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (45119, 'szerszvadze', 2019, 'student', 'DS2');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (74380, 'chekhonin', 2019, 'student', 'DS2');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (20332, 'sharafudinov', 2019, 'student', 'DS2');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (69685, 'sharakhov', 2019, 'sab', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (71369, 'shakhova', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (35578, 'shirokova', 2019, 'student', 'DS1');
INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (43401, 'shmyrev', 2019, 'student', 'DS1');



INSERT INTO course (id_course, c_name, c_semester, c_formula) VALUES (1454, 'NLA', 1, NULL);
INSERT INTO course (id_course, c_name, c_semester, c_formula) VALUES (1674, 'ML1', 1, NULL);
INSERT INTO course (id_course, c_name, c_semester, c_formula) VALUES (3403, 'Python', 1, NULL);
INSERT INTO course (id_course, c_name, c_semester, c_formula) VALUES (7117, 'Algo', 1, NULL);
INSERT INTO course (id_course, c_name, c_semester, c_formula) VALUES (2116, 'SA', 1, NULL);
INSERT INTO course (id_course, c_name, c_semester, c_formula) VALUES (5056, 'DM', 1, NULL);
INSERT INTO course (id_course, c_name, c_semester, c_formula) VALUES (7043, 'BD', 1, NULL);
INSERT INTO course (id_course, c_name, c_semester, c_formula) VALUES (1755, 'OPT1', 2, 'example');
INSERT INTO course (id_course, c_name, c_semester, c_formula) VALUES (9518, 'ML2', 2, NULL);
INSERT INTO course (id_course, c_name, c_semester, c_formula) VALUES (6317, 'DO', 2, NULL);
INSERT INTO course (id_course, c_name, c_semester, c_formula) VALUES (9472, 'PP', 2, NULL);
INSERT INTO course (id_course, c_name, c_semester, c_formula) VALUES (5286, 'ToG', 2, NULL);
INSERT INTO course (id_course, c_name, c_semester, c_formula) VALUES (1974, 'BA', 2, NULL);
INSERT INTO course (id_course, c_name, c_semester, c_formula) VALUES (5006, 'PAlgo', 2, NULL);



INSERT INTO student_course (id_student, id_course) VALUES (11528, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (11528, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (11528, 2116);
INSERT INTO student_course (id_student, id_course) VALUES (11528, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (12327, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (12327, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (12327, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (12327, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (13657, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (13657, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (13657, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (13657, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (13859, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (13859, 2116);
INSERT INTO student_course (id_student, id_course) VALUES (13859, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (19757, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (19757, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (19757, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (19757, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (20332, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (20332, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (20332, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (22139, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (22139, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (22139, 2116);
INSERT INTO student_course (id_student, id_course) VALUES (22139, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (22241, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (22241, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (22241, 2116);
INSERT INTO student_course (id_student, id_course) VALUES (22241, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (22594, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (22594, 5056);
INSERT INTO student_course (id_student, id_course) VALUES (22594, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (24138, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (24138, 5056);
INSERT INTO student_course (id_student, id_course) VALUES (24138, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (24138, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (24259, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (24259, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (24259, 2116);
INSERT INTO student_course (id_student, id_course) VALUES (24259, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (25601, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (25601, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (25601, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (25601, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (26910, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (26910, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (26910, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (26910, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (29122, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (29122, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (29122, 2116);
INSERT INTO student_course (id_student, id_course) VALUES (29122, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (29273, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (29273, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (29273, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (29273, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (29273, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (29868, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (29868, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (29868, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (29868, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (29868, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (30989, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (30989, 5056);
INSERT INTO student_course (id_student, id_course) VALUES (30989, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (30989, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (30989, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (31476, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (31476, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (31476, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (33059, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (33059, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (33059, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (33059, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (33059, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (34795, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (34795, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (34795, 2116);
INSERT INTO student_course (id_student, id_course) VALUES (34795, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (35578, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (35578, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (35578, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (35578, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (38312, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (38312, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (38312, 2116);
INSERT INTO student_course (id_student, id_course) VALUES (38312, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (38807, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (38807, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (38807, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (40041, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (40041, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (40041, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (40041, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (40339, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (40339, 5056);
INSERT INTO student_course (id_student, id_course) VALUES (40339, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (40339, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (40339, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (40339, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (43401, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (43401, 5056);
INSERT INTO student_course (id_student, id_course) VALUES (43401, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (43401, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (43401, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (43461, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (43461, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (43461, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (43461, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (44575, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (44575, 5056);
INSERT INTO student_course (id_student, id_course) VALUES (44575, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (44575, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (44575, 2116);
INSERT INTO student_course (id_student, id_course) VALUES (44575, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (45119, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (45119, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (45119, 2116);
INSERT INTO student_course (id_student, id_course) VALUES (45119, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (50342, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (50342, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (50342, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (50342, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (51571, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (51571, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (51571, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (51571, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (57790, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (57790, 5056);
INSERT INTO student_course (id_student, id_course) VALUES (57790, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (57790, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (60661, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (60661, 5056);
INSERT INTO student_course (id_student, id_course) VALUES (60661, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (61370, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (61370, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (61370, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (61370, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (62553, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (62553, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (62553, 2116);
INSERT INTO student_course (id_student, id_course) VALUES (62553, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (67792, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (67792, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (67792, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (67792, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (71369, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (71369, 5056);
INSERT INTO student_course (id_student, id_course) VALUES (71369, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (71369, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (71369, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (71948, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (71948, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (71948, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (71948, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (74380, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (74380, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (74380, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (74380, 2116);
INSERT INTO student_course (id_student, id_course) VALUES (74380, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (74528, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (74528, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (74528, 2116);
INSERT INTO student_course (id_student, id_course) VALUES (74528, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (75159, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (75159, 5056);
INSERT INTO student_course (id_student, id_course) VALUES (75159, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (75159, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (75159, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (77650, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (77650, 5056);
INSERT INTO student_course (id_student, id_course) VALUES (77650, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (77650, 2116);
INSERT INTO student_course (id_student, id_course) VALUES (77650, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (81697, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (81697, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (81697, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (82845, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (82845, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (82845, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (82845, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (87484, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (87484, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (87484, 2116);
INSERT INTO student_course (id_student, id_course) VALUES (87484, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (87827, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (87827, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (87827, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (87827, 2116);
INSERT INTO student_course (id_student, id_course) VALUES (87827, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (88783, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (88783, 5056);
INSERT INTO student_course (id_student, id_course) VALUES (88783, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (88783, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (95108, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (95108, 5056);
INSERT INTO student_course (id_student, id_course) VALUES (95108, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (95108, 2116);
INSERT INTO student_course (id_student, id_course) VALUES (95108, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (95263, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (95263, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (95263, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (95263, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (95339, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (95339, 7117);
INSERT INTO student_course (id_student, id_course) VALUES (95339, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (95339, 7043);
INSERT INTO student_course (id_student, id_course) VALUES (95929, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (95929, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (95929, 2116);
INSERT INTO student_course (id_student, id_course) VALUES (95929, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (97899, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (97899, 5056);
INSERT INTO student_course (id_student, id_course) VALUES (97899, 2116);
INSERT INTO student_course (id_student, id_course) VALUES (97899, 1454);
INSERT INTO student_course (id_student, id_course) VALUES (98588, 1674);
INSERT INTO student_course (id_student, id_course) VALUES (98588, 5056);
INSERT INTO student_course (id_student, id_course) VALUES (98588, 3403);
INSERT INTO student_course (id_student, id_course) VALUES (98588, 1454);

INSERT INTO student_course (id_student, id_course) VALUES (11528, 1974);
INSERT INTO student_course (id_student, id_course) VALUES (22139, 1974);
INSERT INTO student_course (id_student, id_course) VALUES (22594, 1974);
INSERT INTO student_course (id_student, id_course) VALUES (24259, 1974);
INSERT INTO student_course (id_student, id_course) VALUES (29122, 1974);
INSERT INTO student_course (id_student, id_course) VALUES (31476, 1974);
INSERT INTO student_course (id_student, id_course) VALUES (34795, 1974);
INSERT INTO student_course (id_student, id_course) VALUES (38807, 1974);
INSERT INTO student_course (id_student, id_course) VALUES (44575, 1974);
INSERT INTO student_course (id_student, id_course) VALUES (57790, 1974);
INSERT INTO student_course (id_student, id_course) VALUES (62553, 1974);
INSERT INTO student_course (id_student, id_course) VALUES (77650, 1974);
INSERT INTO student_course (id_student, id_course) VALUES (81697, 1974);
INSERT INTO student_course (id_student, id_course) VALUES (87827, 1974);
INSERT INTO student_course (id_student, id_course) VALUES (95108, 1974);
INSERT INTO student_course (id_student, id_course) VALUES (95929, 1974);
INSERT INTO student_course (id_student, id_course) VALUES (98588, 1974);
INSERT INTO student_course (id_student, id_course) VALUES (11528, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (12327, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (13657, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (13859, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (19757, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (20332, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (22139, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (22241, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (22594, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (24138, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (24259, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (25601, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (26910, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (29122, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (29273, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (29868, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (30989, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (31476, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (33059, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (34795, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (35578, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (38312, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (38807, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (40041, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (40339, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (43401, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (43461, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (44575, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (45119, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (50342, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (51571, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (57790, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (60661, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (61370, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (62553, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (67792, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (71369, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (71948, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (74380, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (74528, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (75159, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (77650, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (81697, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (82845, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (87484, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (87827, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (88783, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (95108, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (95263, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (95339, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (95929, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (97899, 9518);
INSERT INTO student_course (id_student, id_course) VALUES (98588, 9518);