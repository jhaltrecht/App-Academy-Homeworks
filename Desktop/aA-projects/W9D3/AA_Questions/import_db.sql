DROP TABLE IF EXISTS questions_follows;
DROP TABLE IF EXISTS questions_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;
PRAGMA foreign_keys= ON;

CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    fname VARCHAR(255),
    lname VARCHAR(255)
);

CREATE TABLE questions(
    
    id INTEGER PRIMARY KEY,
    title TEXT,
    body TEXT,
    author_id Integer,
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE questions_follows(
    id INTEGER PRIMARY KEY,
    question_id INTEGER ,
    author_id INTEGER ,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);
CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    question_id INTEGER ,
    parent_reply_id INTEGER ,
    author_id INTEGER,
    body TEXT,
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE questions_likes(
    id INTEGER PRIMARY KEY,
    author_id INTEGER,
    question_id INTEGER,
    FOREIGN KEY(question_id) REFERENCES questions(id),
    FOREIGN KEY(author_id) REFERENCES users(id)
);

INSERT INTO 
    users (fname,lname)
VALUES
    ('James','Bond'),
    ('Jason','Bourne'),
    ('Tom', 'Cruize');


INSERT INTO 
    questions(title,body,author_id)
VALUES
    ('how do I shoot a basketball?', 'What do I need to do to score?',(SELECT id FROM users WHERE fname='James' AND lname='Bond')),
    ('how do I fire a weapon?', 'I am new and do not have the technique',(SELECT id FROM users WHERE fname='Jason' AND lname='Bourne'));

INSERT INTO 
    questions_follows(question_id,author_id)
VALUES 
    ((SELECT id FROM questions WHERE title='how do I shoot a basketball?'),(SELECT id from users WHERE fname='James' AND lname='Bond'))   ,
    ((SELECT id FROM questions WHERE title='how do I fire a weapon?'),(SELECT id from users WHERE fname='Jason' AND lname='Bourne'));

INSERT INTO 
replies(question_id,parent_reply_id,author_id,body)
VALUES
    ((SELECT id FROM questions WHERE title = 'how do I shoot a basketball?'),NULL,
    (SELECT id FROM users WHERE fname = "James" AND lname = "Bond"),"bend down and point your elbows to the rim");
INSERT INTO 
replies(question_id,parent_reply_id,author_id,body)
VALUES
    ((SELECT id FROM questions WHERE title = 'how do I shoot a basketball?'),
    (SELECT id FROM replies WHERE body = "bend down and point your elbows to the rim"),
    (SELECT id FROM users WHERE fname = "Tom" AND lname = "Cruize"),"bad advice, instead close your eyes and shoot");
INSERT INTO 
replies(question_id,parent_reply_id,author_id,body)
VALUES   
((SELECT id FROM questions WHERE title = 'how do I fire a weapon?'),NULL,(SELECT id FROM users WHERE fname = "Jason" AND lname = "Bourne"),"close an eye and aim for the target");

    
INSERT INTO 
    questions_likes(author_id,question_id)
VALUES 
    ((SELECT id FROM users WHERE fname='James' AND lname='Bond'),(SELECT id FROM questions WHERE title = 'how do I shoot a basketball?')),
    ((SELECT id FROM users WHERE fname='Jason' AND lname='Bourne'),(SELECT id FROM questions WHERE title = 'how do I firea weapon?'));

