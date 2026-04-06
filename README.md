# Análisis de Ventas: Flujo de Datos


### Descripción
Análisis de inicio a fin en un dataset de ventas con 40,000 registros aplicando un Marco de trabajo que abarca desde la Gobernanza de Datos hasta la Observabilidad post-entrega.


## Stack Tecnológico
* **Limpieza Inicial**: Excel (Validación y limpieza de nulos).
* **Base de Datos**: MySQL (procesamiento masivo y lógica de negocio).
* **Visualización**: Tableau (Storytelling interactivo).
* **Metodología**: SCRUM, DataOps, CRISP-DM.


## Desarrollo del Proyecto

### 1. Estrategia y Marco Ético
* **Diccionario de Datos**: Definición técnica de 16 variables.
* **Gobernanza**: Implementación de un catálogo de datos y linaje para asegurar la trazabilidad desde el CSV original hasta el dashboard final.
* **Ética**: Anonimización de CustomerID y cumplimiento de principios de transparencia en el filtrado de datos.

### 2. Gestión Predictiva (Agile)
* **Metodología**: Uso de SCRUM para el control de flujo.
* **Definition of Done (DoD)**: Cada consulta SQL fue validada bajo criterios de legibilidad (indentación), comentarios de lógica y validación con muestras de Excel.

### 3. Infraestructura Robusta (DataOps)
* **Esquema de Datos**: Diseño de la tabla con tipos de datos optimizados. Uso de 'NOT NULL', 'DEFAULT', 'CHECK' & 'ENUM' que sirven para mantener la integridad de los datos.
* **Data Quality Gates**: Implementación de scripts SQL automáticos para detectar nulos, valores negativos en UnitPrice/Quantity y Categorías huérfanas.

### 4. Análisis Modular (CRISP-DM)
* **Procesamiento**: Uso de Views para modularizar el cálculo de Net Revenue, aplicar Filtros y Agrupaciones.
* **Estadística**: Aplicación de medidas de tendencia central y dispersión para identificar el ticket promedio y el rendimiento por categoría.

### 5. Comunicación Estratégica
* **Visualización**: Construcción de un Dashboard en Tableau enfocado en el usuario final.
* **Storytelling**: Implementación de filtros de acción y jerarquías para permitir el "Drill-down" desde la visión global del país hasta el detalle del producto.
* **UAT**: Validación de resultados visuales contra la fuente de verdad (SQL).

### 6. Monitoreo y Salud (Observabilidad)
* **Data Drift**: Definición de umbrales para detectar cambios bruscos en el comportamiento de las ventas.
* **Auditoría**: Creación de un script de monitoreo de salud para supervisar el volumen y la frescura de los datos cargados.


## Estructura del Proyecto

```
sales-data-workflow/
│
├── datasets/
│   ├── 01_online_retail_dataset.csv
│   ├── 02_ventas_limpias.csv
│   └── 03_sales_insights.csv
│
├── dashboards/
│   ├── dashboard_drill-down.png
│   └── dashboard_full_view.png
│
├── sql/
│   ├── 01_creacion_esquema.sql
│   ├── 02_ingesta_datos.sql
│   ├── 03_pruebas_calidad.sql
│   ├── 04_consulta_modular.sql
│   └── 05_auditoria.sql
│
├── README.md/
│
└── process_log.pdf
```
