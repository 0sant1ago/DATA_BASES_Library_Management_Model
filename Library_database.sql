create database library_database;
 
create table AUTHOR(
    AUTHOR_ID integer primary key,
    AUTHOR_NAME text,
    AUTHOR_SURNAME text not null
);

create table CATEGORY(
    CATEGORY_ID integer primary key,
    CATEGORY_NAME text not null
);

create table BOOK(
    BOOK_ID integer primary key,
    BOOK_TITLE text not null,
    CATEGORY_ID integer not null,
    foreign key (CATEGORY_ID) references CATEGORY(CATEGORY_ID)
);

create table EDITORIAL(
    EDITORIAL_ID integer primary key,
    EDITORIAL_NAME text
);

create table BOOK_COPY(
    BOOK_COPY_ID integer primary key,
    BOOK_ID integer not null,
    EDITORIAL_ID integer not null,
    BOOK_COPY_YEAR_PUBLISHED date not null,
    BOOK_COPY_LANGUAGE text not null,
    foreign key (BOOK_ID) references BOOK(BOOK_ID),
    foreign key (EDITORIAL_ID) references EDITORIAL(EDITORIAL_ID)
);

create table BOOK_AUTHOR(
    BOOK_ID integer not null,
    AUTHOR_ID integer not null,
    foreign key (BOOK_ID) references BOOK(BOOK_ID),
    foreign key (AUTHOR_ID) references AUTHOR(AUTHOR_ID)
);

create table PATRON_ACCOUNT(
    PATRON_ID integer primary key,
    FIRST_NAME text not null,
    SURNAME text not null,
    EMAIL text,
    PATRON_ACCOUNT_STATUS text not null
);

create table WAITING_LIST(
    PATRON_ID integer not null,
    BOOK_ID integer not null,
    foreign key (PATRON_ID) references PATRON_ACCOUNT(PATRON_ID)
    foreign key (BOOK_ID) references BOOK(BOOK_ID)
);

create table CHECKOUT(
    CHECKOUT_ID integer primary key,
    START_TIME date not null,
    END_TIME date not null,
    BOOK_COPY_ID integer not null,
    IS_RETURNED boolean not null
    PATRON_ID integer not null,
    foreign key (BOOK_COPY_ID) references BOOK_COPY(BOOK_COPY_ID),
    foreign key (PATRON_ID) references PATRON_ACCOUNT(PATRON_ID)
);    
   
