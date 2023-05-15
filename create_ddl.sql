create table AUTHOR (
    AUTHOR_ID serial primary key,
    AUTHOR_NAME text,
    AUTHOR_SURNAME text not null
);

create table CATEGORY (
    CATEGORY_ID serial primary key,
    CATEGORY_NAME text not null
);

create table BOOK (
    BOOK_ID serial primary key,
    BOOK_TITLE text not null,
    CATEGORY_ID serial not null,
    foreign key (CATEGORY_ID) references CATEGORY(CATEGORY_ID)
);

create table EDITORIAL (
    EDITORIAL_ID serial primary key,
    EDITORIAL_NAME text
);

create table BOOK_COPY (
    BOOK_COPY_ID serial primary key,
    BOOK_ID serial not null,
    EDITORIAL_ID serial not null,
    BOOK_COPY_YEAR_PUBLISHED date not null,
    BOOK_COPY_LANGUAGE text not null,
    foreign key (BOOK_ID) references BOOK(BOOK_ID),
    foreign key (EDITORIAL_ID) references EDITORIAL(EDITORIAL_ID)
);

create table BOOK_AUTHOR (
    BOOK_ID serial not null,
    AUTHOR_ID serial not null,
    foreign key (BOOK_ID) references BOOK(BOOK_ID),
    foreign key (AUTHOR_ID) references AUTHOR(AUTHOR_ID)
);

create table PATRON_ACCOUNT (
    PATRON_ID serial primary key,
    FIRST_NAME text not null,
    SURNAME text not null,
    EMAIL text,
    PATRON_ACCOUNT_STATUS text not null
);

create table WAITING_LIST (
    PATRON_ID serial not null,
    BOOK_ID serial not null,
    foreign key (PATRON_ID) references PATRON_ACCOUNT(PATRON_ID),
    foreign key (BOOK_ID) references BOOK(BOOK_ID)
);
