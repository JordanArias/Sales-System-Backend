# Sistema Integrado de Gestión Comercial - Backend

Este repositorio contiene la **parte Backend** de la aplicación "Sistema Integrado de Gestión Comercial".  
Está construido en **Node.js + Express** y maneja toda la **lógica de negocio, base de datos y APIs**, conectándose con el Frontend para servir los datos del sistema.

---

## 🚀 Tecnologías utilizadas

- Node.js  
- Express  
- PostgreSQL  
- Sequelize (u otro ORM si aplicas)  
- JWT para autenticación  
- bcrypt para encriptación de contraseñas  

---

## ⚙️ Funcionalidades del Backend

- Gestión de usuarios y roles con permisos personalizados  
- CRUD de productos (simples y compuestos)  
- Registro y seguimiento de ventas  
- Control de caja con ingresos y egresos  
- Gestión de inventario y movimientos de insumos  
- Cocina: gestión de pedidos según estado  
- APIs REST para conectar con el Frontend  
- Manejo de precios y saldos en dos divisas (Bs y ARS)  

---
## 🧩 Configuración de la base de datos
Este proyecto incluye un **backup completo de la base de datos** con las tablas y un usuario administrador ya configurado.
#### 1. Instalar PostgreSQL v7.2 en adelante (si aún no está instalado).
#### 2. Crear la base de datos (si aún no existe):
```bash
  createdb sistema_ventas
```
#### 3. Importar el backup incluido en la carpeta "database":
```bash
psql -U postgres -d sistema_restaurante -f ./database/sistema_integrado_backup.sql
```
#### 4. Datos incluidos en el backup
Tablas: usuarios, roles, productos, ventas, caja, clientes, inventario, reportes, etc.

Usuario administrador ya creado:
```bash
Ci: 1234567
Contraseña: 1234567 (cifrada con bcrypt)
```

## 🧰 Instalación y ejecución del repositorio del Backend
#### 1. Clonar el repositorio:
```bash
git clone https://github.com/JordanArias/Sales-System-Backend.git
```
#### 2. Entrar al directorio:
```bash
cd Sales-System-Backend
```
#### 3. Instalar dependencias:
```bash
npm install
```
#### 4. Configurar variables de entorno:
```bash
PORT=3000
DB_HOST=localhost
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=tu_contraseña
DB_NAME=sistema_restaurante
JWT_SECRET=clave_secreta
```
#### 5. Ejecutar el proyecto:
```bash
npm run dev
```
#### 6. Probar las APIs:
```bash
# Usar Postman o Insomnia para enviar solicitudes a:
# http://localhost:3000 (o el puerto que configures)
```
## 📂 Conexión al Frontend
Este backend se conecta con el Frontend para enviar y recibir datos del sistema:
🔗 [Sales System Frontend](https://github.com/JordanArias/Sales-System-Frontend) 
## 👨‍💻 Autor
**Fabrizio Jordan Arias Marca**  
📧 ariasjordan943@gmail.com  
🌐 [jordandeveloper.netlify.app](https://jordandeveloper.netlify.app)
