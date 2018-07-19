#�μ� ���̺�
drop table dept CASCADE CONSTRAINTS;
create table dept{
	deptno varchar2(15) primary key,
	deptname varchar2(15),
	deptStartDay date,
	deptEndDay date,
	deptlevel varchar2(5),
	deptstep varchar2(5),
	deptuppercode varchar2(15),
	job_category varchar2(15),
	mgr_id varchar2(15),
	deptaddr varchar2(50),
	depttel varchar2(15),
}
#�λ� ���̺�
drop table member CASCADE CONSTRAINTS;
create table member(
	id varchar2(20) primary key,
	name varchar2(15),
	ssn varchar2(15),
	birthday date,
	marry char(1),
	gender char(1),
	position varchar2(15),
	duty varchar2(15),
	classes varchar2(15),
	startday date,
	endday date,
	deptno varchar2(15),
	curstate varchar2(10),
	zipcode varchar2(10),
	addr varchar2(80),
	detailaddr varchar2(50),
	phonehome varchar2(15),
	phoneco varchar2(15),
	phonecell varchar2(15),
	email varchar2(50),
	profile_photo varchar2(50))

#�������̺�
drop table job CASCADE CONSTRAINTS;
create table job(
	job_id varchar2(10) primary key,
	job_name varchar2(15),
	job_category varchar2(15),
	menupath varchar2(50))

#��������
alter table member
add constraint member_fk foreign key(deptno) references dept(deptno)


alter table dept
add constraint dept_fk foreign key(mgr_id) references member(id)

alter table dept
add constraint job_fk foreign key(job_category) references job(job_category)

#������

insert into dept values('d001','�λ���','1999/9/27',null,'2','1','dg001','j001','9401023jang','����� ���ʱ� kitri����7��','02-225-1111');
insert into dept values('d002','�繫��','1999/9/27',null,'2','1','dg001','j001','9401023jang','����� ���ʱ� kitri����7��','02-225-1111');
insert into dept values('d003','������','1999/9/27',null,'2','1','dg001','j001','9401023jang','����� ���ʱ� kitri����7��','02-225-1111');
insert into dept values('d004','��������','1999/9/27',null,'2','1','dg001','j001','9401023jang','����� ���ʱ� kitri����7��','02-225-1111');
insert into dept values('d005','�ý���������','1999/9/27',null,'2','1','dg001','j001','9401023jang','����� ���ʱ� kitri����7��','02-225-1111');
insert into dept values('d006','�ѹ���','1999/9/27',null,'2','1','dg001','j001','9401023jang','����� ���ʱ� kitri����7��','02-225-1111');
insert into dept values('dg001','�濵��������','1999/9/27',null,'2','1','dg001','j001','9401023jang','����� ���ʱ� kitri����7��','02-225-1111');
insert into dept values('dg002','��������','1999/9/27',null,'2','1','dg001','j001','9401023jang','����� ���ʱ� kitri����7��','02-225-1111');
insert into dept values('dg003','IT��������','1999/9/27',null,'2','1','dg001','j001','9401023jang','����� ���ʱ� kitri����7��','02-225-1111');
insert into dept values('d007','������','1999/9/27',null,'2','1','dg001','j001','9401023jang','����� ���ʱ� kitri����7��','02-225-1111');
insert into dept values('d008','��ȹ��','1999/9/27',null,'2','1','dg001','j001','9401023jang','����� ���ʱ� kitri����7��','02-225-1111');
insert into dept values('d009','����1��','1999/9/27',null,'2','1','dg001','j001','9401023jang','����� ���ʱ� kitri����7��','02-225-1111');
insert into dept values('d010','�����������','1999/9/27',null,'2','1','dg001','j001','9401023jang','����� ���ʱ� kitri����7��','02-225-1111');
insert into dept values('d011','����2��','1999/9/27',null,'2','1','dg001','j001','9401023jang','����� ���ʱ� kitri����7��','02-225-1111');
insert into dept values('d012','�����ý�','1999/9/27',null,'2','1','dg001','j001','9401023jang','����� ���ʱ� kitri����7��','02-225-1111');








