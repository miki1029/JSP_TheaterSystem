create or replace function getTodaysDate
return Date
is
vDate Date;

begin

	select CURRENT_DATE
	into vDate
	from dual;
	
	--dbms_output.put_line(vDate);
	
  return vDate;

end;
/