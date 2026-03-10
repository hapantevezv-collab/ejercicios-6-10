# -*- coding: utf-8 -*-
# =========================================================
# Ejercicios 6.10 - Estructuras de datos en Julia
# Solución corregida
# =========================================================

# ---------------------------------------------------------
# Ejercicio 1: Rutas de monitoreo (tuplas y vectores)
# ---------------------------------------------------------

# 1) Tuplas estáticas con coordenadas
punto_1 = (11.1198, -74.0321)
punto_2 = (11.1250, -74.0280)
punto_3 = (11.1302, -74.0215)

# 2) Colección secuencial y mutable
ruta_avistamiento = [punto_1, punto_2, punto_3]

# 3) Agregar nuevo punto al final
punto_4 = (11.1355, -74.0150)
push!(ruta_avistamiento, punto_4)

# 4) Extraer último punto usando indexación dinámica
ultimo_reporte = ruta_avistamiento[end]

# 5) Vector paralelo de elevaciones
# Cada elevación corresponde al punto en la misma posición de la ruta.
elevaciones = [850.5, 920.0, 1050.2, 1180.8]

# 6) Cálculos solicitados
elevacion_maxima = maximum(elevaciones)
total_puntos = length(ruta_avistamiento)

println("=== Ejercicio 1 ===")
println("Ruta completa: ", ruta_avistamiento)
println("Último reporte: ", ultimo_reporte)
println("Elevación máxima: ", elevacion_maxima, " msnm")
println("Número total de puntos visitados: ", total_puntos)

# ---------------------------------------------------------
# Ejercicio 2: Metadatos y ecosistemas (diccionario y conjunto)
# ---------------------------------------------------------

# 1) Diccionario del parque
pnn_tayrona = Dict(
    "nombre" => "PNN Tayrona",
    "area_hectareas" => 15000,
    "abierto_turismo" => true,
    "ecosistemas" => ["Manglar", "Bosque Seco", "Coral"]
)

# 2) Acceso seguro a clave inexistente
fecha_creacion = get(pnn_tayrona, "fecha_creacion", "Dato no disponible")

# 3) Actualizar diccionario
pnn_tayrona["departamento"] = "Magdalena"

# 4) Observaciones crudas con duplicados
observaciones_crudas = ["Manglar", "Coral", "Bosque Seco", "Manglar", "Coral", "Matorral"]
observaciones_unicas = Set(observaciones_crudas)

# 5) Intersección entre ecosistemas oficiales y observaciones únicas
ecosistemas_oficiales = Set(pnn_tayrona["ecosistemas"])
ecosistemas_avistados = intersect(ecosistemas_oficiales, observaciones_unicas)

# Presentación ordenada para lectura humana
observaciones_unicas_ordenadas = sort(collect(observaciones_unicas))
ecosistemas_avistados_ordenados = sort(collect(ecosistemas_avistados))

println("\n=== Ejercicio 2 ===")
println("Fecha de creación: ", fecha_creacion)
println("Diccionario actualizado: ", pnn_tayrona)
println("Observaciones únicas (ordenadas): ", observaciones_unicas_ordenadas)
println("Ecosistemas oficiales avistados hoy (ordenados): ", ecosistemas_avistados_ordenados)

# ---------------------------------------------------------
# Validación automática
# ---------------------------------------------------------

@assert punto_1 == (11.1198, -74.0321)
@assert punto_2 == (11.1250, -74.0280)
@assert punto_3 == (11.1302, -74.0215)
@assert punto_4 == (11.1355, -74.0150)
@assert length(ruta_avistamiento) == 4
@assert ultimo_reporte == (11.1355, -74.0150)
@assert elevacion_maxima == 1180.8
@assert total_puntos == 4

@assert pnn_tayrona["nombre"] == "PNN Tayrona"
@assert pnn_tayrona["area_hectareas"] == 15000
@assert pnn_tayrona["abierto_turismo"] == true
@assert pnn_tayrona["departamento"] == "Magdalena"
@assert fecha_creacion == "Dato no disponible"
@assert observaciones_unicas == Set(["Manglar", "Coral", "Bosque Seco", "Matorral"])
@assert ecosistemas_avistados == Set(["Manglar", "Coral", "Bosque Seco"])

println("\nValidación completada: todos los ejercicios operaron correctamente.")


