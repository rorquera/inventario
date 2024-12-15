--partidos que se juegan el 22 de junio
SELECT *
FROM public.t_partido
WHERE DATE(fecha) = '2024-06-22';

--pronostico de un usuario especifico
SELECT p.id, u.nombre, u.cedula, p.partido, eqa.nombre as nombreqa, eqb.nombre as nombreqb, p.marcador_eq_a, p.marcador_eq_b
FROM public.t_pronostico p
join public.t_usuario u on p.usuario=u.cedula
join public.t_partido pa on pa.id = p.partido
join public.t_equipo eqa on eqa.codigo=p.equipo_a
join public.t_equipo eqb on eqb.codigo=p.equipo_b
WHERE p.usuario='1725456895';

--pronostico de un partido especifico
SELECT *
FROM public.t_pronostico
WHERE partido=8