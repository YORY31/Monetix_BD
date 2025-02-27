# MONETIX_APP - Documentación de la Base de Datos

## Descripción General
**MONETIX_APP** es una base de datos diseñada para gestionar transacciones financieras de usuarios. Permite a los usuarios registrar ingresos y gastos, administrar presupuestos y establecer metas de ahorro.

## Estructura de la Base de Datos
La base de datos se compone de varias tablas principales:

### 1. **Usuarios (`USERS`)**
Almacena la información de los usuarios registrados.
- `ID_USER` (INT, PK) - Identificador único del usuario.
- `NAME_USER` (NVARCHAR) - Nombre del usuario.
- `EMAIL` (NVARCHAR, UNIQUE) - Correo electrónico del usuario.
- `PASSWORDHASH` (NVARCHAR) - Hash de la contraseña.
- `IS_ACTIVE_USER` (BIT) - Indica si el usuario está activo.

### 2. **Categorías (`CATEGORIES`)**
Define las categorías de transacciones (ej. "Alimentación", "Salario").
- `CATEGORY_ID` (INT, PK) - Identificador único de la categoría.
- `NAME_CATEGORY` (NVARCHAR) - Nombre de la categoría.
- `TYPE` (NVARCHAR) - Puede ser "Income" o "Expense".

### 3. **Transacciones (`TRANSACTIONS`)**
Registra los ingresos y gastos de los usuarios.
- `TRANSACTIONID` (INT, PK) - Identificador único de la transacción.
- `USERID` (INT, FK -> USERS) - Usuario que realizó la transacción.
- `CATEGORYID` (INT, FK -> CATEGORIES) - Categoría asociada.
- `AMOUNT` (DECIMAL) - Monto de la transacción.
- `TRANSACTIONDATE` (DATETIME) - Fecha de la transacción.

### 4. **Presupuestos (`BUDGETS`)**
Permite a los usuarios establecer límites de gasto por categoría.
- `BUDGETID` (INT, PK) - Identificador único.
- `USERID` (INT, FK -> USERS) - Usuario asociado.
- `CATEGORYID` (INT, FK -> CATEGORIES) - Categoría de presupuesto.
- `MAXAMOUNT` (DECIMAL) - Límite de gasto.
- `STARTDATE` (DATETIME) - Fecha de inicio.
- `ENDDATE` (DATETIME) - Fecha de fin.

### 5. **Metas de Ahorro (`SAVINGS_GOALS`)**
Los usuarios pueden establecer objetivos financieros.
- `GOAL_ID` (INT, PK) - Identificador de la meta.
- `USERID` (INT, FK -> USERS) - Usuario que establece la meta.
- `TARGETAMOUNT` (DECIMAL) - Monto objetivo.
- `SAVEDAMOUNT` (DECIMAL) - Monto ahorrado hasta el momento.

## Procedimientos Almacenados Destacados
- `INSERT_TRANSACTION` - Inserta una nueva transacción.
- `GET_USER` - Recupera información de un usuario.
- `DISABLEINACTIVEUSERS` - Desactiva usuarios inactivos por más de 30 días.

## Índices y Optimización
- `IDX_TRACSACTIONS_USER` - Mejora consultas de transacciones por usuario.
- `IDX_SAVINGGOALS_IS_ACHIEVED` - Optimiza búsqueda de metas cumplidas.

## Notas
- La base de datos usa `RECOVERY SIMPLE` para reducir el tamaño del log de transacciones.
- `QUERY_STORE` está activado para monitorear el rendimiento de consultas.

## Autores
- **Equipo de Desarrollo de MONETIX_APP(Mayory Astacio)**

