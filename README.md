# Análisis de Ventas: Flujo de Datos

### Descripción
En este proyecto realicé un análisis de inicio a fin en un dataset de ventas, aplicando un marco de trabajo que abarca desde la Gobernanza de Datos hasta la Observabilidad post-entrega.

## Stack Tecnológico
* **Limpieza Inicial**: Excel (Validación y limpieza de nulos).
* **Base de Datos**: MySQL (procesamiento masivo).
* **Visualización**: Tableau (Storytelling interactivo).
* **Metodología**: SCRUM / CRISP-DM.

## Desarrollo del Proyecto (6-Stage Framework)

### 1. Estrategia y Marco Ético
* **Diccionario de Datos**: Definición técnica de 16 variables.
* **Gobernanza**: Implementación de un catálogo de datos y linaje para asegurar la trazabilidad desde el CSV original hasta el dashboard final.
* **Ética**: Anonimización de CustomerID y cumplimiento de principios de transparencia en el filtrado de datos.

### 2. Gestión Predictiva (Agile)
* **Metodología**: Uso de Kanban para el control de flujo.
* **Definition of Done (DoD)**: Cada consulta SQL fue validada bajo criterios de legibilidad (indentación), comentarios de lógica y validación con muestras de Excel.

### 3. Infraestructura Robusta (DataOps)
* **Esquema de Datos**: Diseño de la tabla con tipos de datos optimizados. Uso de 'NOT NULL', 'DEFAULT', 'CHECK' & 'ENUM' que sirven para mantener la integridad de los datos.
* **Data Quality Gates**: Implementación de scripts SQL automáticos para detectar nulos, valores negativos en UnitPrice/Quantity y Categorías huérfanas.

### 4. Análisis Modular (CRISP-DM)
* **Procesamiento**: Uso de CTEs (Common Table Expressions) para modularizar el cálculo de Net Revenue.
* **Estadística**: Aplicación de medidas de tendencia central y dispersión para identificar el ticket promedio y el rendimiento por categoría.

5. Comunicación Estratégica
Visualización: Construcción de un Dashboard en Tableau enfocado en el usuario final.
Storytelling: Implementación de filtros de acción y jerarquías para permitir el "Drill-down" desde la visión global del país hasta el detalle del producto.
UAT: Validación de resultados visuales contra la fuente de verdad (SQL).

6. Monitoreo y Salud (Observability)
Data Drift: Definición de umbrales para detectar cambios bruscos en el comportamiento de las ventas.
Auditoría: Creación de un script de monitoreo de salud para supervisar el volumen y la frescura de los datos cargados.
