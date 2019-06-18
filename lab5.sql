create table student
(
    student_id integer primary key autoincrement,
    full_name  text not null unique,
    group_id   integer references "group"
);

create table teacher
(
    teacher_id integer primary key autoincrement,
    full_name  text not null unique
);


create table "group"
(
    group_id   integer primary key autoincrement,
    group_name text not null unique
);

create table subject
(
    subject_id   integer primary key autoincrement,
    subject_name text not null unique
);

create table class
(
    class_id  integer primary key autoincrement,
    course_id integer not null references course,
    time      text    not null
);

create table attendance
(
    attendance_id integer primary key autoincrement,
    student_id    integer not null references student,
    class_id      integer not null references class
);

create table course
(
    course_id  integer primary key autoincrement,
    group_id   integer not null references "group",
    class_id   integer not null references class,
    subject_id integer not null references subject,
    teacher_id integer not null references teacher,
    unique (group_id, subject_id)

);

create table rating
(
    rating_id  integer primary key autoincrement,
    student_id integer not null references student,
    course_id  integer not null references course,
    rating     integer not null check (0 < rating and rating <= 100),
    unique (student_id, course_id)
);
