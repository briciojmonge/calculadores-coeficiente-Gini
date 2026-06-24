unit clasificacion_gini;

{$mode objfpc}{$H+}

interface

// Devuelve una descripcion textual segun el valor del indice de Gini.
function ClassificarGini(G: Real): String;

implementation

// Asigna una etiqueta cualitativa al coeficiente de Gini calculado.
function ClassificarGini(G: Real): String;
begin
  // Los umbrales dividen el indice en bandas de interpretacion sencilla.
  if G < 0.3 then
    ClassificarGini := 'Muy buena distribucion del ingreso'
  else if G < 0.35 then
    ClassificarGini := 'Buena distribucion del ingreso'
  else if G < 0.4 then
    ClassificarGini := 'Distribucion regular del ingreso'
  else if G < 0.45 then
    ClassificarGini := 'Distribucion desigual del ingreso'
  else if G < 0.5 then
    ClassificarGini := 'Mala distribucion del ingreso'
  else
    ClassificarGini := 'Enorme desigualdad del ingreso';
end;

end.