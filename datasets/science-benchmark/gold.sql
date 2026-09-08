SELECT T1.total_cost FROM projects AS T1 WHERE T1.title = 'Theseus'	cordis
SELECT T1.total_cost FROM projects AS T1 WHERE T1.title = 'Theseus'	cordis
SELECT acronym FROM projects WHERE start_year = 2018	cordis
SELECT acronym FROM projects WHERE start_year = 2018	cordis
SELECT title FROM projects WHERE start_year < 2016	cordis
SELECT title FROM projects WHERE start_year < 2016	cordis
SELECT T1.institutions_name FROM institutions AS T1 JOIN eu_territorial_units AS T2 ON T1.geocode_regions_3 = T2.geocode_regions WHERE T2.description = 'Nordjylland'	cordis
SELECT T1.institutions_name FROM institutions AS T1 JOIN eu_territorial_units AS T2 ON T1.geocode_regions_3 = T2.geocode_regions WHERE T2.description = 'Nordjylland'	cordis
SELECT T2.full_name FROM projects AS T1 join people as T2 on T1.principal_investigator = T2.unics_id WHERE T1.start_year = 2014	cordis
SELECT T2.full_name FROM projects AS T1 join people as T2 on T1.principal_investigator = T2.unics_id WHERE T1.start_year = 2014	cordis
SELECT t1.title FROM projects AS T1 join project_subject_areas as psa on T1.unics_id = psa.project join subject_areas as sa on psa.subject_area = sa.code WHERE sa.title = 'Mathematics and Statistics'	cordis
SELECT t1.acronym, sa.description FROM projects AS T1 join project_subject_areas as psa on T1.unics_id = psa.project join subject_areas as sa on psa.subject_area = sa.code WHERE sa.title = 'Mathematics and Statistics'	cordis
SELECT distinct t.title FROM projects AS T1 join project_topics as pt on T1.unics_id = pt.project join topics as t on pt.topic = t.code where t1.end_year = 2014	cordis
SELECT distinct t.title FROM projects AS T1 join project_topics as pt on T1.unics_id = pt.project join topics as t on pt.topic = t.code where t1.end_year = 2014	cordis
Select p.acronym from projects as p join project_members as pm on p.unics_id = pm.project join institutions as i on pm.institution_id = i.unics_id join countries as c on i.country_id = c.unics_id where c.country_name = 'Greece'	cordis
Select i.institutions_name from institutions as i join countries as c on i.country_id = c.unics_id where c.country_name = 'France' or c.country_name = 'Germany'	cordis
Select i.institutions_name from institutions as i join countries as c on i.country_id = c.unics_id where c.country_name != 'France'	cordis
Select count(p.unics_id) from projects as p where start_year = 2016	cordis
Select p.title from projects as p where total_cost = (select max(p2.total_cost) from projects as p2)	cordis
SELECT T1.member_name FROM project_members AS T1 JOIN projects AS T2 ON T1.project = T2.unics_id WHERE T2.total_cost < (SELECT AVG(T23.total_cost) FROM projects AS T23)	cordis
select p.unics_id from projects as p join project_members as pm on p.unics_id = pm.project group by p.unics_id having count(p.unics_id) >= 100	cordis
select s.code, s.title from funding_schemes as s where s.code = (select s2.code from funding_schemes as s2 join projects as p on s2.code = p.ec_fund_scheme group by s2.code order by count(*) desc LIMIT 1)	cordis
SELECT sum(total_cost) FROM projects	cordis
select title from projects where start_year > 2006 and end_year > 2006	cordis
select title, end_year - start_year from projects order by end_year - start_year desc limit 1	cordis
select title from topics where title like 'Raw materials%'	cordis
select title from topics where title like '%climate%'	cordis
select count(*) from projects as p join people as peep on p.principal_investigator = peep.unics_id where peep.full_name = 'Thomas Bell'	cordis
select distinct full_name from people	cordis
select p.acronym from projects as p where p.total_cost between 100000 and 200000	cordis
select p.title from projects as p where p.total_cost > 1000000	cordis
select p.title from projects as p where p.total_cost > 1000000	cordis
select title, member_name from projects as p join project_members as pm on p.unics_id = pm.project join project_member_roles as pmr on pm.member_role = pmr.code where pmr.code = 'partner'	cordis
select distinct description from erc_research_domains	cordis
select c.country_name from countries as c join institutions as i on c.unics_id = i.country_id	cordis
select c.country_name from countries as c join institutions as i on c.unics_id = i.country_id	cordis
select country_code2, country_code3 from countries where country_name = 'Andorra'	cordis
select code from funding_schemes where title = 'Framework Partnership Agreement'	cordis
select title from programmes where short_name = 'Transport'	cordis
select pm.member_name, pr.code from project_members as pm join projects as p on pm.project = p.unics_id join project_member_roles as pr on pm.member_role = pr.code where p.acronym = 'GTBB'	cordis
select pm.member_name, pr.code from project_members as pm join projects as p on pm.project = p.unics_id join project_member_roles as pr on pm.member_role = pr.code where p.acronym = 'GTBB'	cordis
select title from programmes where parent = 'FP7'	cordis
select title from programmes where parent = 'FP7'	cordis
select p.description from erc_panels as p join erc_research_domains as erd on p.part_of = erd.code where erd.description = 'Life Sciences'	cordis
select p.description from erc_panels as p join erc_research_domains as erd on p.part_of = erd.code where erd.description = 'Life Sciences'	cordis
select member_name from project_members as mb join activity_types as a on a.code = mb.activity_type where a.description = 'Research Organisations'	cordis
select member_name from project_members as mb join activity_types as a on a.code = mb.activity_type where a.description = 'Research Organisations'	cordis
select objective from projects where acronym = 'DEEPCARBON'	cordis
select objective from projects where acronym = 'DEEPCARBON'	cordis
select title from projects where objective like '%carbon capturing%'	cordis
select count(*) from projects where objective like '%carbon capturing%'	cordis
select i.institutions_name from institutions as i join countries as c on c.unics_id = i.country_id where country_name = 'France' except select i.institutions_name from institutions as i join countries as c on c.unics_id = i.country_id join eu_territorial_units as etu on i.geocode_regions_3 = etu.geocode_regions where country_name = 'France' and etu.description = 'Paris'	cordis
select i.institutions_name from institutions as i join countries as c on c.unics_id = i.country_id where country_name = 'France' except select i.institutions_name from institutions as i join countries as c on c.unics_id = i.country_id join eu_territorial_units as etu on i.geocode_regions_3 = etu.geocode_regions where country_name = 'France' and etu.description = 'Paris'	cordis
SELECT distinct member_name from project_members WHERE member_name NOT in (SELECT member_name from project_members where member_role = 'coordinator')	cordis
SELECT distinct member_name from project_members WHERE member_name NOT in (SELECT member_name from project_members where member_role = 'coordinator')	cordis
SELECT t1.full_name, count(p.title) FROM people as t1 join projects as p on t1.unics_id = p.principal_investigator group by t1.full_name HAVING count(p.title) > 1	cordis
SELECT t1.full_name, count(p.title) FROM people as t1 join projects as p on t1.unics_id = p.principal_investigator group by t1.full_name HAVING count(p.title) > 1	cordis
SELECT t1.title, MAX(t3.ec_max_contribution) from subject_areas as t1 join project_subject_areas as t2 on t1.code = t2.subject_area join projects as t3 on t2.project = t3.unics_id group by t1.title order by MAX(t3.ec_max_contribution) DESC LIMIT 1	cordis
SELECT t1.title, MAX(t3.ec_max_contribution) from subject_areas as t1 join project_subject_areas as t2 on t1.code = t2.subject_area join projects as t3 on t2.project = t3.unics_id group by t1.title order by MAX(t3.ec_max_contribution) DESC LIMIT 1	cordis
SELECT t1.title, MIN(t3.ec_max_contribution) from subject_areas as t1 join project_subject_areas as t2 on t1.code = t2.subject_area join projects as t3 on t2.project = t3.unics_id group by t1.title order by MIN(t3.ec_max_contribution) DESC LIMIT 1	cordis
SELECT t1.title, MIN(t3.ec_max_contribution) from subject_areas as t1 join project_subject_areas as t2 on t1.code = t2.subject_area join projects as t3 on t2.project = t3.unics_id group by t1.title order by MIN(t3.ec_max_contribution) DESC LIMIT 1	cordis
Select i.institutions_name, Count(distinct project) From project_members join institutions as i on project_members.institution_id = i.unics_id GROUP BY i.institutions_name order by count(distinct project) desc limit 1	cordis
Select i.institutions_name, Count(distinct project) From project_members join institutions as i on project_members.institution_id = i.unics_id GROUP BY i.institutions_name order by count(distinct project) desc limit 1	cordis
Select t2.institutions_name, Count(distinct project) From project_members as t1 join institutions as t2 on t1.institution_id = t2.unics_id GROUP BY t2.institutions_name order by count(distinct project) asc limit 1	cordis
Select t2.institutions_name, Count(distinct project) From project_members as t1 join institutions as t2 on t1.institution_id = t2.unics_id GROUP BY t2.institutions_name order by count(distinct project) asc limit 1	cordis
SELECT t1.title, sum(ec_max_contribution) from funding_schemes as t1 join projects as t2 on t1.code = t2.ec_fund_scheme group by t1.title ORDER BY sum(ec_max_contribution) DESC LIMIT 1	cordis
SELECT t1.title, sum(ec_max_contribution) from funding_schemes as t1 join projects as t2 on t1.code = t2.ec_fund_scheme group by t1.title ORDER BY sum(ec_max_contribution) ASC LIMIT 1	cordis
SELECT t1.member_name, p.ec_max_contribution FROM project_members as t1 join activity_types as t2 on t1.activity_type = t2.code join projects as p on t1.project = p.unics_id WHERE t2.code = 'PRC' ORDER BY ec_max_contribution DESC	cordis
SELECT t1.member_name, p.ec_max_contribution FROM project_members as t1 join activity_types as t2 on t1.activity_type = t2.code join projects as p on t1.project = p.unics_id WHERE t2.code = 'PRC' ORDER BY ec_max_contribution DESC	cordis
SELECT p.title, p.start_year from projects as p order by start_year DESC	cordis
SELECT p.title, p.start_year from projects as p order by start_year DESC	cordis
SELECT p.title, p.start_year from projects as p order by start_year ASC	cordis
SELECT p.title, p.start_year from projects as p order by start_year ASC	cordis
SELECT p.start_date from projects as p order by start_date ASC	cordis
SELECT p.start_date from projects as p order by start_date ASC	cordis
SELECT t3.title from subject_areas as t1 join project_subject_areas as t2 on t1.code = t2.subject_area join projects as t3 on t2.project = t3.unics_id WHERE t1.title = 'Climate change and Carbon cycle research'	cordis
SELECT t3.title from subject_areas as t1 join project_subject_areas as t2 on t1.code = t2.subject_area join projects as t3 on t2.project = t3.unics_id WHERE t1.title = 'Climate change and Carbon cycle research'	cordis
SELECT pmr.description from project_member_roles as pmr	cordis
SELECT pmr.description from project_member_roles as pmr	cordis
SELECT count(t1.description) from erc_panels as t1 join erc_research_domains as t2 on t2.code = t1.part_of WHERE t2.description = 'Life Sciences'	cordis
SELECT count(t1.description) from erc_panels as t1 join erc_research_domains as t2 on t2.code = t1.part_of WHERE t2.code = 'LS'	cordis
SELECT t1.description from erc_panels as t1 join erc_research_domains as t2 on t2.code = t1.part_of WHERE t2.code = 'SH'	cordis
SELECT count(t1.description) from erc_panels as t1 join erc_research_domains as t2 on t2.code = t1.part_of WHERE t2.code = 'SH'	cordis
SELECT member_name FROM project_members as t1 join activity_types as t2 on t1.activity_type = t2.code WHERE t2.code = 'PRC'	cordis
SELECT member_name FROM project_members as t1 join activity_types as t2 on t1.activity_type = t2.code WHERE t2.code = 'PRC'	cordis
SELECT count(member_name) FROM project_members as t1 join activity_types as t2 on t1.activity_type = t2.code WHERE t2.code = 'PRC'	cordis
SELECT count (distinct member_name) FROM project_members as t1 join activity_types as t2 on t1.activity_type = t2.code WHERE t2.code = 'HES'	cordis
SELECT count (distinct member_name) FROM project_members as t1 join activity_types as t2 on t1.activity_type = t2.code WHERE t2.description = 'Higher or Secondary Education Establishments'	cordis
SELECT count(t3.title) from subject_areas as t1 join project_subject_areas as t2 on t1.code = t2.subject_area join projects as t3 on t2.project = t3.unics_id WHERE t1.title = 'Robotics'	cordis
SELECT count(t3.title) from subject_areas as t1 join project_subject_areas as t2 on t1.code = t2.subject_area join projects as t3 on t2.project = t3.unics_id WHERE t1.title = 'Robotics'	cordis
SELECT t1.member_name, p.ec_max_contribution FROM project_members as t1 join activity_types as t2 on t1.activity_type = t2.code join projects as p on t1.project = p.unics_id WHERE t1.geocode_regions_3 = 'NONEU' ORDER BY ec_max_contribution DESC LIMIT 1	cordis
SELECT t1.member_name, p.ec_max_contribution FROM project_members as t1 join activity_types as t2 on t1.activity_type = t2.code join projects as p on t1.project = p.unics_id WHERE t1.geocode_regions_3 = 'NONEU' ORDER BY ec_max_contribution DESC LIMIT 1	cordis
SELECT t1.member_name, p.ec_max_contribution FROM project_members as t1 join activity_types as t2 on t1.activity_type = t2.code join projects as p on t1.project = p.unics_id WHERE t1.geocode_regions_3 = 'NONEU' ORDER BY ec_max_contribution ASC LIMIT 1	cordis
SELECT t1.member_name, p.ec_max_contribution FROM project_members as t1 join activity_types as t2 on t1.activity_type = t2.code join projects as p on t1.project = p.unics_id WHERE t1.geocode_regions_3 = 'NONEU' ORDER BY ec_max_contribution ASC LIMIT 1	cordis
SELECT count(distinct t1.member_name) FROM project_members as t1 join activity_types as t2 on t1.activity_type = t2.code join projects as p on t1.project = p.unics_id WHERE t1.geocode_regions_3 = 'NONEU'	cordis
SELECT distinct t1.member_name FROM project_members as t1 join activity_types as t2 on t1.activity_type = t2.code join projects as p on t1.project = p.unics_id WHERE t1.geocode_regions_3 = 'NONEU'	cordis
SELECT p.title from programmes as p WHERE p.title like '%climate%'	cordis
SELECT p.title from programmes as p WHERE p.title like '%climate%'	cordis
SELECT t1.title, sum(t3.ec_max_contribution) from programmes as t1 join project_programmes as t2 on t1.code = t2.programme join projects as t3 on t3.unics_id = t2.project group by t1.title	cordis
SELECT t1.title, sum(t3.ec_max_contribution) from programmes as t1 join project_programmes as t2 on t1.code = t2.programme join projects as t3 on t3.unics_id = t2.project group by t1.title	cordis
select p.objid from photoobj as p JOIN photo_type as pt on p.type = pt.value where pt.name = 'STAR'	sdss
select p.objid from photoobj as p JOIN photo_type as pt on p.type = pt.value where pt.name = 'STAR'	sdss
select p.objid, p.ra, p.dec from photoobj as p join specobj as s on s.bestobjid = p.objid join photo_type as pt on p.type = pt.value where pt.name = 'STAR'	sdss
select p.objid, p.ra, p.dec from photoobj as p join specobj as s on s.bestobjid = p.objid join photo_type as pt on p.type = pt.value where pt.name = 'STAR'	sdss
select p.objid from photoobj as p JOIN photo_type as pt on p.type = pt.value where pt.name = 'GALAXY'	sdss
select p.objid from photoobj as p JOIN photo_type as pt on p.type = pt.value where pt.name = 'GALAXY'	sdss
select p.objid, p.ra, p.dec from photoobj as p join specobj as s on s.bestobjid = p.objid join photo_type as pt on p.type = pt.value where pt.name = 'GALAXY'	sdss
select p.objid, p.ra, p.dec from photoobj as p join specobj as s on s.bestobjid = p.objid join photo_type as pt on p.type = pt.value where pt.name = 'GALAXY'	sdss
select p.objid, p.ra, p.dec from photoobj as p JOIN photo_type as pt on p.type = pt.value where p.ra > 185 and p.ra < 186 and p.dec > 15 and p.dec < 16 and pt.name = 'GALAXY'	sdss
select p.objid, p.ra, p.dec from photoobj as p JOIN photo_type as pt on p.type = pt.value where p.ra > 185 and p.ra < 186 and p.dec > 15 and p.dec < 16 and pt.name = 'GALAXY'	sdss
select p.objid, p.ra, p.dec from photoobj as p JOIN photo_type as pt on p.type = pt.value where p.ra > 185 and p.ra < 186 and p.dec > 15 and p.dec < 16 and pt.name = 'STAR'	sdss
select p.objid, p.ra, p.dec from photoobj as p JOIN photo_type as pt on p.type = pt.value where p.ra > 185 and p.ra < 186 and p.dec > 15 and p.dec < 16 and pt.name = 'STAR'	sdss
select p.objid, p.ra, p.dec, s.z from Photoobj as p join specobj as s on s.bestobjid = p.objid where s.ra > 185 and s.ra < 186 AND s.dec > 15 and s.dec < 16 and s.class = 'STAR'	sdss
select p.objid, p.ra, p.dec, s.z from Photoobj as p join specobj as s on s.bestobjid = p.objid where s.ra > 185 and s.ra < 186 AND s.dec > 15 and s.dec < 16 and s.class = 'STAR'	sdss
select p.objID, p.ra, p.dec, s.z from Photoobj as p join specobj as s on s.bestobjid = p.objid where s.ra > 185 and s.ra < 186 AND s.dec > 15 and s.dec < 16 and s.class = 'GALAXY'	sdss
select p.objID, p.ra, p.dec, s.z from Photoobj as p join specobj as s on s.bestobjid = p.objid where s.ra > 185 and s.ra < 186 AND s.dec > 15 and s.dec < 16 and s.class = 'GALAXY'	sdss
select p.objid from photoobj as p JOIN photo_type as pt on p.type = pt.value where pt.name = 'STAR' and p.u - p.g < 0.4 and p.g - p.r < 0.7 and p.r - p.i > 0.4 and p.i - p.z > 0.4	sdss
select p.objid from photoobj as p JOIN photo_type as pt on p.type = pt.value where pt.name = 'STAR' and p.u - p.g < 0.4 and p.g - p.r < 0.7 and p.r - p.i > 0.4 and p.i - p.z > 0.4	sdss
select p.objid from photoobj as p join photo_type as pt on p.type = pt.value where pt.name = 'STAR' and (p.u - p.g) < 0.4 and (p.g - p.r) < 0.7 and (p.r - p.i) > 0.4 and (p.i - p.z) > 0.4 and p.objid in (select n.objid from neighbors as n join photo_type as pt on n.neighbortype = pt.value where n.distance < 0.05 and pt.name = 'STAR');	sdss
select p.objid from photoobj as p join photo_type as pt on p.type = pt.value where pt.name = 'STAR' and (p.u - p.g) < 0.4 and (p.g - p.r) < 0.7 and (p.r - p.i) > 0.4 and (p.i - p.z) > 0.4 and p.objid in (select n.objid from neighbors as n join photo_type as pt on n.neighbortype = pt.value where n.distance < 0.05 and pt.name = 'STAR');	sdss
select count(*) from photoobj as p join photo_type as pt on p.type = pt.value where p.r < 17 and p.extinction_r > 0.2 and pt.name = 'GALAXY'	sdss
select count(*) from photoobj as p join photo_type as pt on p.type = pt.value where p.r < 17 and p.extinction_r > 0.2 and pt.name = 'GALAXY'	sdss
select p.objid, p.g from photoobj as p join photo_type as pt on p.type = pt.value where pt.name = 'GALAXY' and p.g <= 22 and p.u - p.g >= -0.27 and p.u - p.g < 0.71 and p.g - p.r >= -0.24 and p.g - p.r < 0.35 and p.r - p.i >= -0.27 and p.r - p.i < 0.57 and p.i - p.z >= -0.35 and p.i - p.z < 0.7 order by p.g desc	sdss
select p.objid, p.g from photoobj as p join photo_type as pt on p.type = pt.value where pt.name = 'GALAXY' and p.g <= 22 and p.u - p.g >= -0.27 and p.u - p.g < 0.71 and p.g - p.r >= -0.24 and p.g - p.r < 0.35 and p.r - p.i >= -0.27 and p.r - p.i < 0.57 and p.i - p.z >= -0.35 and p.i - p.z < 0.7 order by p.g desc	sdss
SELECT p.objid, p.ra, p.dec from photoobj AS p JOIN photo_type AS pt ON p.type = pt.value where pt.name = 'STAR' and i < 19 and i > 0 and g - r > 2.26 and i - z < 0.25 and u - g > 2.0 or u > 22.3	sdss
SELECT p.objid, p.ra, p.dec from photoobj AS p JOIN photo_type AS pt ON p.type = pt.value where pt.name = 'STAR' and i < 19 and i > 0 and g - r > 2.26 and i - z < 0.25 and u - g > 2.0 or u > 22.3	sdss
select objid, ra, dec from photoobj as p join photo_type as pt on p.type = pt.value where pt.name = 'GALAXY' and p.ra between 140.9 and 141.1 and p.g < 18.0 and p.u - p.g > 2.2	sdss
select objid, ra, dec from photoobj as p join photo_type as pt on p.type = pt.value where pt.name = 'GALAXY' and p.ra between 140.9 and 141.1 and p.g < 18.0 and p.u - p.g > 2.2	sdss
select p.objid, p.ra, p.dec from photoobj as p join specobj as s on s.bestobjid = p.objid where s.class = 'GALAXY' and p.g between 17 and 18 and s.z < 0.05	sdss
select p.objid, p.ra, p.dec from photoobj as p join specobj as s on s.bestobjid = p.objid where s.class = 'GALAXY' and p.g between 17 and 18 and s.z < 0.05	sdss
select p.objid, p.ra, p.dec from photoobj as p join photo_type as pt on p.type = pt.value where pt.name = 'STAR' and p.u - p.g < 0.5	sdss
select p.objid, p.ra, p.dec from photoobj as p join photo_type as pt on p.type = pt.value where pt.name = 'STAR' and p.u - p.g < 0.5	sdss
select p.u, p.g, p.r, p.i, p.z from photoobj as p join photo_type as pt on p.type = pt.value where pt.name = 'STAR' and p.u - p.g < 0.5	sdss
select p.u, p.g, p.r, p.i, p.z from photoobj as p join photo_type as pt on p.type = pt.value where pt.name = 'STAR' and p.u - p.g < 0.5	sdss
select p.objid, p.ra, p.dec from photoobj as p join specobj as s on s.bestobjid = p.objid where s.class = 'GALAXY' and p.g between 17 and 18 and s.z < 0.05	sdss
select p.objid, p.ra, p.dec from photoobj as p join specobj as s on s.bestobjid = p.objid where s.class = 'GALAXY' and p.g between 17 and 18 and s.z < 0.05	sdss
select p.u, p.g, p.r, p.i, p.z from photoobj as p join specobj as s on s.bestobjid = p.objid where s.class = 'GALAXY' and p.g between 17 and 18 and s.z < 0.05	sdss
select p.u, p.g, p.r, p.i, p.z from photoobj as p join specobj as s on s.bestobjid = p.objid where s.class = 'GALAXY' and p.g between 17 and 18 and s.z < 0.05	sdss
select p.objid, n.neighborobjid, n.distance, n.type from neighbors as n join photoobj as p on n.objid = p.objid	sdss
select p.objid, n.neighborobjid, n.distance, n.type from neighbors as n join photoobj as p on n.objid = p.objid	sdss
select distinct p.type from photoobj as p where p.ra > 100 and p.dec < 100	sdss
select distinct p.type from photoobj as p where p.ra > 100 and p.dec < 100	sdss
select count(*) from photoobj as p join photo_type as pt on p.type = pt.value where pt.name = 'STAR'	sdss
select count(*) from photoobj as p join photo_type as pt on p.type = pt.value where pt.name = 'STAR'	sdss
select distinct pt.name from photo_type as pt join photoobj as p on p.type = pt.value	sdss
select distinct pt.name from photo_type as pt join photoobj as p on p.type = pt.value	sdss
select * from photoobj as p join photo_type as pt on p.type = pt.value where pt.name = 'GALAXY'	sdss
select * from photoobj as p join photo_type as pt on p.type = pt.value where pt.name = 'GALAXY'	sdss
select p.objid, p.ra, p.dec, pt.name from photoobj as p join photo_type as pt on p.type = pt.value where pt.name = 'STAR'	sdss
select p.objid, p.ra, p.dec, pt.name from photoobj as p join photo_type as pt on p.type = pt.value where pt.name = 'STAR'	sdss
select p.objid, s.specobjid from photoobj as p join specobj as s on s.bestobjid = p.objid where s.class = 'GALAXY' and p.u - p.r > 2.22 and p.g - p.i > 1	sdss
select p.objid, s.specobjid from photoobj as p join specobj as s on s.bestobjid = p.objid where s.class = 'GALAXY' and p.u - p.r > 2.22 and p.g - p.i > 1	sdss
SELECT T2.objid, T1.mjd FROM specobj AS T1 JOIN photoobj as T2 ON T1.bestobjid = T2.objid WHERE T1.class = 'STAR' and T1.subclass like '%K%'	sdss
SELECT T2.objid, T1.mjd FROM specobj AS T1 JOIN photoobj as T2 ON T1.bestobjid = T2.objid WHERE T1.class = 'STAR' and T1.subclass like '%K%'	sdss
SELECT T1.z, T1.ra, T1.dec FROM specobj AS T1 JOIN photoobj AS T2 ON T1.bestobjid = T2.objid JOIN photo_type AS T3 ON T2.type = T3.value WHERE T1.subclass = 'STARFORMING' AND T3.name = 'GALAXY'	sdss
SELECT T1.z, T1.ra, T1.dec FROM specobj AS T1 JOIN photoobj AS T2 ON T1.bestobjid = T2.objid JOIN photo_type AS T3 ON T2.type = T3.value WHERE T1.subclass = 'STARFORMING' AND T3.name = 'GALAXY'	sdss
SELECT min( T1.extinction_r), T1.run FROM photoobj AS T1 JOIN photo_type AS T2 ON T1.type = T2.value WHERE T2.name = 'GALAXY' GROUP BY T1.run	sdss
SELECT min( T1.extinction_r), T1.run FROM photoobj AS T1 JOIN photo_type AS T2 ON T1.type = T2.value WHERE T2.name = 'GALAXY' GROUP BY T1.run	sdss
SELECT T1.b, T1.l FROM photoobj AS T1 JOIN specobj AS T2 ON T1.objid = T2.bestobjid where T2.class = 'QSO'	sdss
SELECT T1.b, T1.l FROM photoobj AS T1 JOIN specobj AS T2 ON T1.objid = T2.bestobjid where T2.class = 'QSO'	sdss
SELECT count( T1.objid ) FROM neighbors AS T1 JOIN photoobj AS T2 ON T1.objid = T2.objid JOIN photo_type AS T3 ON T2.type = T3.value WHERE T3.name = 'STAR' and T1.neighbortype = T2.type and T1.distance < 0.05 and T2.u - T2.g < 0.4 and T2.g - T2.r < 0.7 and T2.r - T2.i > 0.4 and T2.i - T2.z > 0.4	sdss
SELECT count( T1.objid ) FROM neighbors AS T1 JOIN photoobj AS T2 ON T1.objid = T2.objid JOIN photo_type AS T3 ON T2.type = T3.value WHERE T3.name = 'STAR' and T1.neighbortype = T2.type and T1.distance < 0.05 and T2.u - T2.g < 0.4 and T2.g - T2.r < 0.7 and T2.r - T2.i > 0.4 and T2.i - T2.z > 0.4	sdss
SELECT COUNT(p.objid) FROM photoobj AS p JOIN photo_type AS pt ON p.type = pt.value WHERE pt.name = 'STAR' AND (p.u - p.g) < 0.4 AND (p.g - p.r) < 0.7 AND (p.r - p.i) > 0.4 AND (p.i - p.z) > 0.4 AND p.objid in (SELECT n.objid FROM neighbors AS n JOIN photo_type AS pt ON n.neighbortype = pt.value WHERE n.distance < 0.05 AND pt.name = 'STAR')	sdss
SELECT COUNT(p.objid) FROM photoobj AS p JOIN photo_type AS pt ON p.type = pt.value WHERE pt.name = 'STAR' AND (p.u - p.g) < 0.4 AND (p.g - p.r) < 0.7 AND (p.r - p.i) > 0.4 AND (p.i - p.z) > 0.4 AND p.objid in (SELECT n.objid FROM neighbors AS n JOIN photo_type AS pt ON n.neighbortype = pt.value WHERE n.distance < 0.05 AND pt.name = 'STAR')	sdss
select s.specobjid from specobj as s JOIN photoobj as p ON s.bestobjid = p.objid JOIN photo_type as pt ON p.type = pt.value WHERE s.class = 'STAR' and pt.name = 'STAR' and s.subclass = 'Carbon'	sdss
select s.specobjid from specobj as s JOIN photoobj as p ON s.bestobjid = p.objid JOIN photo_type as pt ON p.type = pt.value WHERE s.class = 'STAR' and pt.name = 'STAR' and s.subclass = 'Carbon'	sdss
select COUNT(*) from photoobj as p join photo_type as pt on p.type = pt.value where pt.name = 'GALAXY'	sdss
select COUNT(*) from photoobj as p join photo_type as pt on p.type = pt.value where pt.name = 'GALAXY'	sdss
select s.specobjid, s.class, s.subclass from specobj as s join photoobj as p on s.bestobjid = p.objid join photo_type as pt on p.type = pt.value where s.subclass like '%AGN%' and s.class = 'GALAXY' and pt.name = 'GALAXY'	sdss
select s.specobjid, s.class, s.subclass from specobj as s join photoobj as p on s.bestobjid = p.objid join photo_type as pt on p.type = pt.value where s.subclass like '%AGN%' and s.class = 'GALAXY' and pt.name = 'GALAXY'	sdss
SELECT min(n.distance) FROM neighbors AS n JOIN photo_type AS pt ON n.neighbortype = pt.value JOIN photoobj AS p ON p.objid = n.objid WHERE pt.name = 'STAR' and p.objid in (SELECT p.objid FROM photoobj AS p JOIN photo_type AS pt ON p.type = pt.value WHERE pt.name = 'STAR')	sdss
SELECT min(n.distance) FROM neighbors AS n JOIN photo_type AS pt ON n.neighbortype = pt.value JOIN photoobj AS p ON p.objid = n.objid WHERE pt.name = 'STAR' and p.objid in (SELECT p.objid FROM photoobj AS p JOIN photo_type AS pt ON p.type = pt.value WHERE pt.name = 'STAR')	sdss
SELECT max(n.distance) FROM neighbors AS n JOIN photo_type AS pt ON n.neighbortype = pt.value JOIN photoobj AS p ON p.objid = n.objid WHERE pt.name = 'GALAXY' and p.objid in (SELECT p.objid FROM photoobj AS p JOIN photo_type AS pt ON p.type = pt.value WHERE pt.name = 'GALAXY')	sdss
SELECT max(n.distance) FROM neighbors AS n JOIN photo_type AS pt ON n.neighbortype = pt.value JOIN photoobj AS p ON p.objid = n.objid WHERE pt.name = 'GALAXY' and p.objid in (SELECT p.objid FROM photoobj AS p JOIN photo_type AS pt ON p.type = pt.value WHERE pt.name = 'GALAXY')	sdss
SELECT p.b, p.l, n.distance from photoobj as p join neighbors n on p.objid = n.objid where n.distance = (select min(n.distance) from neighbors as n)	sdss
SELECT p.b, p.l, n.distance from photoobj as p join neighbors n on p.objid = n.objid where n.distance = (select min(n.distance) from neighbors as n)	sdss
SELECT p.b, p.l, n.distance from photoobj as p join neighbors as n on p.objid = n.objid order by n.distance asc limit 1	sdss
SELECT p.b, p.l, n.distance from photoobj as p join neighbors as n on p.objid = n.objid order by n.distance asc limit 1	sdss
SELECT s.z from specobj as s join photoobj as p on s.bestobjid = p.objid join neighbors as n on p.objid = n.objid where n.distance = (select min(n.distance) from neighbors as n)	sdss
SELECT s.z from specobj as s join photoobj as p on s.bestobjid = p.objid join neighbors as n on p.objid = n.objid where n.distance = (select min(n.distance) from neighbors as n)	sdss
SELECT s.z from specobj as s join photoobj as p on s.bestobjid = p.objid join neighbors as n on p.objid = n.objid order by n.distance asc limit 1	sdss
SELECT s.z from specobj as s join photoobj as p on s.bestobjid = p.objid join neighbors as n on p.objid = n.objid order by n.distance asc limit 1	sdss
select distinct p.run from photoobj as p	sdss
select distinct p.run from photoobj as p	sdss
select count(distinct p.run) from photoobj as p	sdss
select count(distinct p.run) from photoobj as p	sdss
select pt.name, count(*) from photoobj as p join photo_type as pt on pt.value = p.type group by pt.name	sdss
select pt.name, count(*) from photoobj as p join photo_type as pt on pt.value = p.type group by pt.name	sdss
select p.ra, p.dec, p.type from spplines as sp join specobj as s on sp.specobjid = s.specobjid join photoobj as p on p.objid = s.bestobjid	sdss
select p.ra, p.dec, p.type from spplines as sp join specobj as s on sp.specobjid = s.specobjid join photoobj as p on p.objid = s.bestobjid	sdss
select p.objid, pt.name from photoobj as p join photo_type as pt on p.type = pt.value where p.ra > 100 and p.dec < 100	sdss
select p.objid, pt.name from photoobj as p join photo_type as pt on p.type = pt.value where p.ra > 100 and p.dec < 100	sdss
select p.objid, p.ra, p.dec from photoobj as p join specobj as s on s.bestobjid = p.objid join galspecline as g on s.specobjid = g.specobjid	sdss
select p.objid, p.ra, p.dec from photoobj as p join specobj as s on s.bestobjid = p.objid join galspecline as g on s.specobjid = g.specobjid	sdss
select sp.specobjid from spplines as sp join specobj as s on sp.specobjid = s.specobjid	sdss
select sp.specobjid from spplines as sp join specobj as s on sp.specobjid = s.specobjid	sdss
select count(sp.specobjid) from spplines as sp join specobj as s on sp.specobjid = s.specobjid	sdss
select count(sp.specobjid) from spplines as sp join specobj as s on sp.specobjid = s.specobjid	sdss
select * from specobj as s join galspecline as g on s.specobjid = g.specobjid	sdss
select * from specobj as s join galspecline as g on s.specobjid = g.specobjid	sdss
SELECT * FROM disease_mutation WHERE ref_aa = 'E'	oncomx
SELECT count(*) FROM biomarker_fda_test WHERE biomarker_fda_test.test_manufacturer = '23andMe'	oncomx
SELECT speciescommonname FROM species WHERE genus = 'Mus'	oncomx
SELECT * FROM species	oncomx
SELECT * FROM disease_mutation	oncomx
SELECT biomarker_description FROM biomarker	oncomx
SELECT count(*) FROM biomarker_fda_test JOIN biomarker_fda_test_trial ON biomarker_fda_test.test_submission = biomarker_fda_test_trial.test_submission and biomarker_fda_test.test_trade_name = biomarker_fda_test_trial.test_trade_name WHERE test_manufacturer = 'ABBOTT MOLECULAR INC'	oncomx
SELECT biomarker.gene_symbol, biomarker_description FROM biomarker WHERE test_is_a_panel = 'false'	oncomx
SELECT name FROM disease WHERE name like '%cancer%'	oncomx
SELECT biomarker_title, qa_state FROM biomarker_edrn WHERE phase = 'Two'	oncomx
SELECT biomarker_title, qa_state FROM biomarker_edrn WHERE phase = 'Two'	oncomx
SELECT gene_symbol FROM biomarker	oncomx
SELECT biomarker_title FROM biomarker_edrn WHERE biomarker_type != 'Protein'	oncomx
SELECT biomarker_title FROM biomarker_edrn WHERE biomarker_type != 'Protein'	oncomx
SELECT differential_expression.gene_symbol FROM differential_expression JOIN disease ON differential_expression.doid = disease.id WHERE disease.name = 'lung cancer'	oncomx
SELECT biomarker.gene_symbol, biomarker.biomarker_description FROM biomarker JOIN biomarker_fda on biomarker.id = biomarker_fda.id JOIN biomarker_fda_test ON biomarker_fda.test_submission = biomarker_fda_test.test_submission and biomarker_fda.test_trade_name = biomarker_fda_test.test_trade_name JOIN disease ON disease.id = biomarker_fda_test.doid WHERE disease.name = 'breast cancer'	oncomx
SELECT DISTINCT phase from biomarker_edrn	oncomx
SELECT platform_method, test_study_design FROM biomarker_fda_test WHERE test_manufacturer = 'Dako Denmark A/S'	oncomx
SELECT differential_expression.pvalue FROM differential_expression JOIN disease ON differential_expression.doid = disease.id WHERE disease.name = 'lung cancer'	oncomx
SELECT disease_mutation.chromosome_pos FROM disease_mutation JOIN disease ON disease_mutation.doid = disease.id WHERE disease.name = 'skin cancer'	oncomx
SELECT disease_mutation.chromosome_pos FROM disease_mutation JOIN disease ON disease_mutation.doid = disease.id WHERE disease.name = 'skin cancer'	oncomx
SELECT * FROM disease_mutation WHERE ref_aa = 'E'	oncomx
SELECT count(*) FROM biomarker_fda_test WHERE biomarker_fda_test.test_manufacturer = '23andMe'	oncomx
SELECT disease.name FROM differential_expression JOIN disease ON differential_expression.doid = disease.id WHERE differential_expression.gene_symbol = 'A1BG' and differential_expression.expression_change_direction = 'up'	oncomx
SELECT * FROM species	oncomx
SELECT differential_expression.gene_symbol, differential_expression.pvalue FROM differential_expression JOIN disease ON differential_expression.doid = disease.id WHERE differential_expression.gene_symbol = 'EGFR' AND disease.name = 'lung cancer'	oncomx
SELECT differential_expression.gene_symbol, differential_expression.pvalue FROM differential_expression JOIN disease ON differential_expression.doid = disease.id WHERE differential_expression.gene_symbol = 'EGFR' AND disease.name = 'lung cancer'	oncomx
SELECT * FROM disease_mutation	oncomx
SELECT COUNT(*) FROM healthy_expression JOIN stage ON healthy_expression.uberon_developmental_id = stage.id WHERE stage.name = 'late adult stage'	oncomx
SELECT disease.name FROM differential_expression JOIN disease ON differential_expression.doid = disease.id WHERE differential_expression.gene_symbol = 'A1BG' and differential_expression.statistical_significance = 'Yes'	oncomx
SELECT disease.name FROM differential_expression JOIN disease ON differential_expression.doid = disease.id WHERE differential_expression.gene_symbol = 'A1BG' and differential_expression.statistical_significance = 'Yes'	oncomx
SELECT biomarker_description FROM biomarker	oncomx
SELECT biomarker.gene_symbol, biomarker_description FROM biomarker WHERE test_is_a_panel = 'false'	oncomx
SELECT test_trade_name FROM biomarker_fda_test_use WHERE actual_use = 'predisposition'	oncomx
SELECT gene_symbol FROM biomarker	oncomx
SELECT biomarker_title FROM biomarker_edrn WHERE biomarker_type = 'Protein' AND phase = 'Two'	oncomx
SELECT biomarker_title FROM biomarker_edrn WHERE biomarker_type = 'Protein' AND phase = 'Two'	oncomx
SELECT biomarker.gene_symbol, biomarker.biomarker_description FROM biomarker JOIN biomarker_fda on biomarker.id = biomarker_fda.id JOIN biomarker_fda_test ON biomarker_fda.test_submission = biomarker_fda_test.test_submission and biomarker_fda.test_trade_name = biomarker_fda_test.test_trade_name JOIN disease ON disease.id = biomarker_fda_test.doid WHERE disease.name = 'breast cancer'	oncomx
SELECT DISTINCT phase from biomarker_edrn	oncomx
SELECT differential_expression.pvalue FROM differential_expression JOIN disease ON differential_expression.doid = disease.id WHERE disease.name = 'lung cancer'	oncomx
SELECT count(*) FROM xref_gene_ensembl JOIN species ON xref_gene_ensembl.speciesid = species.speciesid WHERE species.genus = 'Homo'	oncomx
SELECT count(*) FROM xref_gene_ensembl JOIN species ON xref_gene_ensembl.speciesid = species.speciesid WHERE species.genus = 'Homo'	oncomx
SELECT * FROM biomarker_fda_test WHERE test_manufacturer like 'Roche%'	oncomx
SELECT test_submission FROM biomarker_fda_test WHERE test_manufacturer like 'Roche%'	oncomx
SELECT disease.name FROM disease JOIN disease_mutation ON disease.id = disease_mutation.doid WHERE disease_mutation.cds_pos = 102997	oncomx
SELECT disease.name FROM disease JOIN disease_mutation ON disease.id = disease_mutation.doid WHERE disease_mutation.cds_pos = 102997	oncomx
SELECT gene_symbol FROM differential_expression WHERE pvalue > 0.39 AND pvalue < 0.41	oncomx
SELECT gene_symbol FROM differential_expression WHERE pvalue > 0.39 AND pvalue < 0.41	oncomx
SELECT DISTINCT disease_mutation.chromosome_id FROM disease_mutation JOIN disease ON disease_mutation.doid = disease.id WHERE disease.name = 'breast cancer'	oncomx
SELECT DISTINCT disease_mutation.chromosome_id FROM disease_mutation JOIN disease ON disease_mutation.doid = disease.id WHERE disease.name = 'breast cancer'	oncomx
SELECT anatomical_entity.name FROM anatomical_entity JOIN healthy_expression ON anatomical_entity.id = healthy_expression.uberon_anatomical_id WHERE expression_level_gene_relative = 'LOW' AND expression_level_anatomical_relative = 'HIGH'	oncomx
SELECT anatomical_entity.name FROM anatomical_entity JOIN healthy_expression ON anatomical_entity.id = healthy_expression.uberon_anatomical_id WHERE expression_level_gene_relative = 'LOW' AND expression_level_anatomical_relative = 'HIGH'	oncomx
SELECT name FROM anatomical_entity WHERE name LIKE 'bone%'	oncomx
SELECT speciescommonname FROM species WHERE genus = 'Mus'	oncomx
SELECT disease.name FROM differential_expression JOIN disease ON differential_expression.doid = disease.id WHERE differential_expression.gene_symbol = 'A1BG' and differential_expression.expression_change_direction = 'up'	oncomx
SELECT COUNT(*) FROM healthy_expression JOIN stage ON healthy_expression.uberon_developmental_id = stage.id WHERE stage.name LIKE 'late adult%'	oncomx
SELECT count(*) FROM biomarker_fda_test JOIN biomarker_fda_test_trial ON biomarker_fda_test.test_submission = biomarker_fda_test_trial.test_submission and biomarker_fda_test.test_trade_name = biomarker_fda_test_trial.test_trade_name WHERE test_manufacturer = 'ABBOTT MOLECULAR INC'	oncomx
SELECT test_trade_name FROM biomarker_fda_test_use WHERE actual_use = 'predisposition'	oncomx
SELECT differential_expression.gene_symbol FROM differential_expression JOIN disease ON differential_expression.doid = disease.id WHERE disease.name = 'lung cancer'	oncomx
SELECT platform_method, test_study_design FROM biomarker_fda_test WHERE test_manufacturer = 'Dako Denmark A/S'	oncomx
SELECT biomarker.biomarker_description FROM biomarker JOIN biomarker_fda ON biomarker.id = biomarker_fda.id JOIN biomarker_fda_test on biomarker_fda.test_submission = biomarker_fda_test.test_submission WHERE biomarker_fda_test.test_approval_status = 'class II'	oncomx
SELECT biomarker.biomarker_description FROM biomarker JOIN biomarker_fda ON biomarker.id = biomarker_fda.id JOIN biomarker_fda_test on biomarker_fda.test_submission = biomarker_fda_test.test_submission WHERE biomarker_fda_test.test_approval_status = 'class II'	oncomx
SELECT * FROM healthy_expression WHERE expression_score > (SELECT AVG(expression_score) FROM healthy_expression)	oncomx
SELECT * FROM healthy_expression WHERE expression_score > (SELECT AVG(expression_score) FROM healthy_expression)	oncomx
SELECT gene_symbol FROM biomarker JOIN biomarker_edrn ON biomarker.id = biomarker_edrn.id JOIN anatomical_entity ON biomarker_edrn.uberon_anatomical_id = anatomical_entity.id WHERE anatomical_entity.name = 'breast' and biomarker_edrn.biomarker_type = 'Genomic'	oncomx
SELECT gene_symbol FROM biomarker JOIN biomarker_edrn ON biomarker.id = biomarker_edrn.id JOIN anatomical_entity ON biomarker_edrn.uberon_anatomical_id = anatomical_entity.id WHERE anatomical_entity.name = 'breast' and biomarker_edrn.biomarker_type = 'Genomic'	oncomx
SELECT disease.name FROM anatomical_entity JOIN cancer_tissue ON anatomical_entity.id = cancer_tissue.uberon_anatomical_id JOIN disease ON cancer_tissue.doid = disease.id WHERE anatomical_entity.name = 'liver'	oncomx
SELECT disease.name FROM anatomical_entity JOIN cancer_tissue ON anatomical_entity.id = cancer_tissue.uberon_anatomical_id JOIN disease ON cancer_tissue.doid = disease.id WHERE anatomical_entity.name = 'liver'	oncomx
SELECT DISTINCT biomarker_fda_test.test_manufacturer FROM biomarker JOIN biomarker_fda on biomarker.id = biomarker_fda.id JOIN biomarker_fda_test ON biomarker_fda.test_trade_name = biomarker_fda_test.test_trade_name AND biomarker_fda.test_submission = biomarker_fda_test.test_submission WHERE biomarker.gene_symbol = 'BRAF'	oncomx
SELECT biomarker_fda_test.test_manufacturer FROM biomarker JOIN biomarker_fda on biomarker.id = biomarker_fda.id JOIN biomarker_fda_test ON biomarker_fda.test_trade_name = biomarker_fda_test.test_trade_name AND biomarker_fda.test_submission = biomarker_fda_test.test_submission WHERE biomarker.gene_symbol = 'BRAF'	oncomx
SELECT anatomical_entity.name, species.speciescommonname FROM anatomical_entity JOIN healthy_expression ON anatomical_entity.id = healthy_expression.uberon_anatomical_id JOIN xref_gene_ensembl ON healthy_expression.ensembl_gene_id = xref_gene_ensembl.ensembl_gene_id JOIN species ON xref_gene_ensembl.speciesid = species.speciesid	oncomx
SELECT distinct anatomical_entity.name FROM healthy_expression JOIN xref_gene_ensembl ON healthy_expression.ensembl_gene_id = xref_gene_ensembl.ensembl_gene_id JOIN anatomical_entity ON healthy_expression.uberon_anatomical_id = anatomical_entity.id WHERE xref_gene_ensembl.gene_symbol = 'A1BG' and healthy_expression.expression_level_anatomical_relative != 'ABSENT'	oncomx
SELECT biomarker.gene_symbol, biomarker.biomarker_description FROM biomarker JOIN biomarker_edrn ON biomarker.id = biomarker_edrn.id JOIN anatomical_entity ON biomarker_edrn.uberon_anatomical_id = anatomical_entity.id WHERE anatomical_entity.name = 'breast' and biomarker_edrn.phase = 'One'	oncomx
SELECT anatomical_entity.name, healthy_expression.expression_score FROM healthy_expression JOIN anatomical_entity ON healthy_expression.uberon_anatomical_id = anatomical_entity.id WHERE healthy_expression.ensembl_gene_id = 'ENSMUSG00000000037' OR healthy_expression.ensembl_gene_id = 'ENSMUSG00000000078'	oncomx
SELECT biomarker_fda_ncit_term.ncit_biomarker FROM biomarker_fda_ncit_term JOIN biomarker_fda ON biomarker_fda_ncit_term.biomarker_fda_id = biomarker_fda.id JOIN biomarker ON biomarker_fda.id = biomarker.id WHERE biomarker.gene_symbol = 'ALDH4A1'	oncomx
SELECT * FROM disease_mutation JOIN disease_mutation_tissue ON disease_mutation.id = disease_mutation_tissue.disease_mutation_id JOIN anatomical_entity ON disease_mutation_tissue.uberon_anatomical_id = anatomical_entity.id WHERE anatomical_entity.name = 'liver'	oncomx
SELECT * FROM anatomical_entity JOIN disease_mutation_tissue ON anatomical_entity.id = disease_mutation_tissue.uberon_anatomical_id JOIN disease_mutation ON disease_mutation_tissue.disease_mutation_id = disease_mutation.id where anatomical_entity.name = 'liver'	oncomx
SELECT gene_symbol FROM biomarker JOIN biomarker_fda ON biomarker.id = biomarker_fda.id JOIN biomarker_fda_test ON biomarker_fda.test_submission = biomarker_fda_test.test_submission WHERE biomarker_fda_test.test_approval_status = 'PMP'	oncomx
SELECT biomarker.biomarker_description FROM biomarker JOIN biomarker_edrn ON biomarker.id = biomarker_edrn.id JOIN anatomical_entity ON biomarker_edrn.uberon_anatomical_id = anatomical_entity.id WHERE anatomical_entity.name = 'breast'	oncomx
SELECT anatomical_entity.name, COUNT(*) FROM biomarker JOIN biomarker_edrn ON biomarker.id = biomarker_edrn.id JOIN anatomical_entity ON biomarker_edrn.uberon_anatomical_id = anatomical_entity.id GROUP BY anatomical_entity.name	oncomx
SELECT * FROM disease_mutation WHERE ref_aa = 'F'	oncomx
SELECT name FROM disease WHERE name like '%cancer%'	oncomx
SELECT distinct(biomarker_fda_test.test_manufacturer), biomarker_fda_test_use.actual_use FROM biomarker JOIN biomarker_fda on biomarker.id = biomarker_fda.id JOIN biomarker_fda_test ON biomarker_fda.test_trade_name = biomarker_fda_test.test_trade_name AND biomarker_fda.test_submission = biomarker_fda_test.test_submission JOIN biomarker_fda_test_use ON biomarker_fda_test.test_submission = biomarker_fda_test_use.test_submission and biomarker_fda_test.test_trade_name = biomarker_fda_test_use.test_trade_name WHERE biomarker.gene_symbol = 'BRAF' AND biomarker_fda_test_use.actual_use = 'diagnostic'	oncomx
SELECT * FROM biomarker JOIN biomarker_edrn ON biomarker.id = biomarker_edrn.id JOIN biomarker_fda on biomarker.id = biomarker_fda.id JOIN biomarker_fda_test ON biomarker_fda.test_submission = biomarker_fda_test.test_submission and biomarker_fda.test_trade_name = biomarker_fda_test.test_trade_name LEFT JOIN anatomical_entity ON anatomical_entity.id = biomarker_edrn.uberon_anatomical_id JOIN cancer_tissue ON cancer_tissue.uberon_anatomical_id = anatomical_entity.id JOIN disease ON disease.id = biomarker_fda_test.doid or disease.id = cancer_tissue.doid WHERE biomarker.test_is_a_panel = 'true' AND biomarker.gene_symbol != 'NULL'	oncomx
select * from biomarker as b join biomarker_fda as bf on b.id = bf.id join biomarker_fda_test as bft on bf.test_trade_name = bft.test_trade_name and bf.test_submission = bft.test_submission where test_manufacturer like '23andMe'	oncomx
select distinct bft.test_manufacturer from biomarker as b join biomarker_fda as bf on b.id = bf.id join biomarker_fda_test as bft on bf.test_trade_name = bft.test_trade_name and bf.test_submission = bft.test_submission where b.gene_symbol like '%BRCA%'	oncomx
select * from biomarker as b join biomarker_fda as bf on b.id = bf.id join biomarker_fda_test as bft on bf.test_trade_name = bft.test_trade_name and bf.test_submission = bft.test_submission join biomarker_fda_test_use as bfu on bfu.test_trade_name = bft.test_trade_name and bfu.test_submission = bft.test_submission where b.gene_symbol like '%BRCA%'	oncomx
SELECT anatomical_entity.name FROM biomarker JOIN biomarker_edrn ON biomarker.id = biomarker_edrn.id JOIN anatomical_entity ON biomarker_edrn.uberon_anatomical_id = anatomical_entity.id GROUP BY anatomical_entity.name ORDER BY COUNT(*) DESC LIMIT 1	oncomx
SELECT chromosome_id, count(*) FROM disease_mutation where data_source = 'cosmic' group by chromosome_id order by count(*) desc limit 5	oncomx
select d.name , count(*) from differential_expression JOIN disease as d ON d.id = doid group by d.name order by count(*) desc limit 3	oncomx
SELECT t1.id from biomarker as t1 join biomarker_edrn as t2 on t1.id = t2.id WHERE t1.id NOT IN (SELECT t1.id from biomarker as t1 join biomarker_fda as t2 on t1.id = t2.id join biomarker_fda_test_use as bftu on t2.test_submission = bftu.test_submission)	oncomx
SELECT t1.id from biomarker as t1 join biomarker_edrn as t2 on t1.id = t2.id WHERE t1.id IN (SELECT t1.id from biomarker as t1 join biomarker_fda as t2 on t1.id = t2.id join biomarker_fda_test_use as bftu on t2.test_submission = bftu.test_submission)	oncomx
SELECT chromosome_id, count(*) FROM disease_mutation where data_source = 'cosmic' group by chromosome_id order by count(*) desc limit 5	oncomx
select biomarker.gene_symbol from disease as dis join biomarker_fda_test as fda on dis.id = fda.doid join biomarker_fda as bio_fda on bio_fda.test_trade_name = fda.test_trade_name join biomarker as bio on bio.id = biomarker_fda.id where dis.name = "prostate cancer"	oncomx
select bio.biomarker_description , test_use.actual_use, count(*) from biomarker_edrn as edrn join anatomical_entity as anat_ent on edrn.uberon_anatomical_id = anat_ent.id join biomarker as bio on bio.id = edrn.id join biomarker_fda as bio_fda on bio_fda.id = bio.id join biomarker_fda_test as fda_test on bio_fda.test_trade_name = fda_test.test_trade_name join biomarker_fda_test_use as test_use on test_use.test_trade_name = fda_test.test_trade_name GROUP BY test_use.actual_use, bio.biomarker_description	oncomx
SELECT distinct(bft.test_trade_name) FROM biomarker_fda_test_use as bftu JOIN biomarker_fda_test as bft ON bft.test_trade_name = bftu.test_trade_name AND bft.test_submission = bftu.test_submission WHERE bftu.approved_indication LIKE '%diagnosis%'	oncomx
SELECT distinct(d.name), bft.test_trade_name, bft.test_manufacturer FROM biomarker_fda_test_use as bftu JOIN biomarker_fda_test as bft ON bft.test_trade_name = bftu.test_trade_name AND bft.test_submission = bftu.test_submission JOIN biomarker_fda as bf ON bft.test_trade_name = bf.test_trade_name AND bft.test_submission = bf.test_submission JOIN biomarker as b ON bf.id = b.id JOIN disease AS d ON d.id = bft.doid WHERE bftu.approved_indication LIKE '%prognosis%' AND d.name LIKE '%lung%'	oncomx
SELECT distinct(d.name) FROM biomarker_fda_test_use as bftu JOIN biomarker_fda_test as bft ON bft.test_trade_name = bftu.test_trade_name AND bft.test_submission = bftu.test_submission JOIN biomarker_fda as bf ON bft.test_trade_name = bf.test_trade_name AND bft.test_submission = bf.test_submission JOIN biomarker as b ON bf.id = b.id JOIN disease AS d ON d.id = bft.doid WHERE bftu.approved_indication LIKE '%diagnosis%' AND bft.specimen_type LIKE 'blood'	oncomx
select bio.biomarker_description, species.species from biomarker as bio join biomarker_edrn as be on bio.id = be.id join anatomical_entity as ae on be.uberon_anatomical_id = ae.id join healthy_expression as he on ae.id = he.uberon_anatomical_id join xref_gene_ensembl as xge on he.ensembl_gene_id = xge.ensembl_gene_id join species as s on xge.speciesid = s.speciesid	oncomx
