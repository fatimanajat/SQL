select*
from layoff_staging3;

select *
from layoff_staging3
where row_numb>1;

select *
from layoff_staging3
where industry is null
or industry='';


select *
from layoff_staging3
where company ='Airbnb';

update layoff_staging3
set industry=null
where industry='';

select *
from layoff_staging3 t1
join layoff_staging3 t2
on t1.company=t2.company
where t1.industry is null
and t2.industry is not null;

update layoff_staging3 t1
join layoff_staging3 t2
on t1.company=t2.company
set t1.industry=t2.industry
where t1.industry is null
and t2.industry is not null;

select *
from layoff_staging3;

select *
from layoff_staging3
where total_laid_off is null
and percentage_laid_off is null;


delete
from layoff_staging3
where total_laid_off is null
and percentage_laid_off is null;

alter table layoff_staging3
drop column row_num;

alter table layoff_staging3
drop column row_numb;

select *
from layoff_staging3;