SELECT 
    ta_type_id,
    exploit_id,
    type_id,
    secteur_id,
    SUM(np_total) AS np_total,
    SUM(np_pmr) AS np_pmr,
    SUM(np_vle) AS np_vle,
    AVG(th_heur) AS th_heure,
    AVG(tv_1h) AS tv_1h
FROM 
    {{ source('staging', 'st_park_p') }} 
JOIN 
    {{ ref('ta_type') }} ON ta_type = ta_type_name
JOIN 
    {{ ref('exploit') }} ON exploit = exploit_name
JOIN 
    {{ ref('secteur') }} ON secteur = secteur_name
JOIN 
    {{ ref('type') }} ON type = type_name
GROUP BY 
    ta_type_id, 
    exploit_id, 
    type_id, 
    secteur_id, 