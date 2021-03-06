# JSP-Blog-master
기존에 있던 JSP-Blog-V2 에 있던 blog 프로젝트 ( https://github.com/tony6303/JSP-BLog-V2 )를 수정, 보완했습니다.

## Blog 기능
회원가입, 아이디 중복체크 , 회원정보 수정  
juso.go.kr 자동 주소 입력 api  
글 작성 , 수정 , 삭제  
글 키워드로 검색 기능(sql : like %keyword% )  
댓글 작성 , 삭제

## 환경

- windows10
- jdk1.8
- tomcat9.0
- sts tool
- mysql8.0

## MySQL 데이터베이스 생성 및 사용자 생성

```sql
create user 'bloguser'@'%' identified by 'bitc5600';
GRANT ALL PRIVILEGES ON *.* TO 'bloguser'@'%';
create database blog;
```

## MySQL 테이블 생성

- bloguser 사용자로 접속
- use blog; 데이터 베이스 선택

```sql
CREATE TABLE user(
    id int primary key auto_increment,
    username varchar(100) not null unique,
    password varchar(100) not null,
    email varchar(100) not null,
    address varchar(100),
    userRole varchar(20),
    createDate timestamp
) engine=InnoDB default charset=utf8;

CREATE TABLE board(
    id int primary key auto_increment,
    userId int,
    title varchar(100) not null,
    content longtext,
    readCount int default 0,
    createDate timestamp,
    foreign key (userId) references user (id)
) engine=InnoDB default charset=utf8;

CREATE TABLE reply(
    id int primary key auto_increment,
    userId int,
    boardId int,
    content varchar(300) not null,
    createDate timestamp,
    foreign key (userId) references user (id) on delete set null,
    foreign key (boardId) references board (id) on delete cascade
) engine=InnoDB default charset=utf8;
```



