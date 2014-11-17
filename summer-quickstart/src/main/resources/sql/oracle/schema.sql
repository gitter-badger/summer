--创建表之前判断是否存在并删除
create or replace procedure proc_dropifexists(
    p_table in varchar2 
) is
    v_count number(10);
begin
   select count(*)
   into v_count
   from user_objects
   where object_name = upper(p_table);

   if v_count > 0 then
      execute immediate 'drop table ' || p_table ||' purge';
   end if;
end;

call proc_dropifexists('srs_task');
call proc_dropifexists('srs_user');

create table srs_task (
  id number(19,0),
  title varchar2(128) not null,
  description varchar2(255),
  user_id number(19,0) not null,
  primary key (id)
);
 
create table srs_user (
  id number(19,0),
  login_name varchar2(64) not null unique,
  name varchar2(64) not null,
  password varchar2(255) not null,
  salt varchar2(64) not null,
  roles varchar2(255) not null,
  register_date date not null,
  primary key (id)
);


create sequence srs_seq_task start with 100 increment by 20;
create sequence srs_seq_user start with 100 increment by 20;

