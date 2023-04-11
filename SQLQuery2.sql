
CREATE TABLE project.dbo.Experiment 
(
UserPseudoId varchar(MAX),
Cattegory varchar(MAX),
Country varchar(MAX),
[Label] varchar(MAX)
);

INSERT INTO project.dbo.Experiment 
(UserPseudoId, Cattegory, Country, [Label])

SELECT user_pseudo_id, category, country, 
CASE WHEN (event_name like N'sign_up' OR event_name like N'purchase') THEN 'experimentID.0'  ELSE 'experimentID.1' END 
FROM project.dbo.dataset;



SELECT * FROM project.dbo.Experiment



SELECT * FROM project.dbo.Experiment where Label like 'experimentID.0'


