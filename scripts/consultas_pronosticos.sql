--partidos que se juegan el 22 de junio
SELECT *
FROM public.t_partido
WHERE DATE(fecha) = '2024-06-22';

--pronostico de un usuario especifico
SELECT *
FROM public.t_pronostico
WHERE usuario='1725456895'

--pronostico de un partido especifico
SELECT *
FROM public.t_pronostico
WHERE partido=8