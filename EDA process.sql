select*
from layoff_staging3;


select max(total_laid_off),max(percentage_laid_off)
from layoff_staging3;
 
select*
from layoff_staging3
where percentage_laid_off=1
order by total_laid_off desc;


select*
from layoff_staging3
where percentage_laid_off=1
order b



select company,sum(total_laid_off)
from layoff_staging3
group by company
order by 2 desc;



select max(`date`),min(`date`)
from layoff_staging3;

select industry,sum(total_laid_off)
from layoff_staging3
group by industry
order by 2 desc;

select country,sum(total_laid_off)
from layoff_staging3
group by country
order by 2 desc;

select `date`,sum(total_laid_off)
from layoff_staging3
group by `date`
order by 1 desc;



select year(`date`),sum(total_laid_off)
from layoff_staging3
group by year(`date`)
order by 1 desc;


select stage,sum(total_laid_off)
from layoff_staging3
group by stage
order by 2 desc ;


select substring(`date`,1,7) as `month`,sum(total_laid_off)
from layoff_staging3
where substring(`date`,1,7) is not  null
group by `month`
order by `month`;


with rolling_total as
(
select substring(`date`,1,7) as `month`,sum(total_laid_off) as rolling_off
from layoff_staging3
where substring(`date`,1,7) is not  null
group by `month`
order by `month`
)
select `month`,rolling_off,sum(rolling_off) over( order by `month` )
from rolling_total ;





select company,year(`date`),sum(total_laid_off)
from layoff_staging3
group by company,year(`date`)
order by 3 desc;




with company_year (company,years,total_laid_off) as
(
select company,year(`date`),sum(total_laid_off)
from layoff_staging3
group by company,year(`date`)
),
 company_year_rank as
(
select *,dense_rank() over (partition by years order by total_laid_off desc) as ranking
from company_year
where years is not null

)
select*
from company_year_rank
where ranking<=5;


