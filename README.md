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

## 🧰 Instalación y ejecución

1. Clonar el repositorio:
```bash
git clone https://github.com/JordanArias/Sales-System-Backend.git
```
2. Entrar al directorio:
```bash
cd Sales-System-Backend
```
3. Instalar dependencias:
```bash
npm install
```
4. Configurar variables de entorno:
```bash
# Crear un archivo .env con los datos de conexión a PostgreSQL y JWT
```
5. Ejecutar el proyecto:
```bash
npm run dev
```
6. Probar las APIs:
```bash
# Usar Postman o Insomnia para enviar solicitudes a:
# http://localhost:3000 (o el puerto que configures)
```
##📂 Conexión al Frontend
Este backend se conecta con el Frontend para enviar y recibir datos del sistema:
🔗 Sales System Frontend

👨‍💻 Autor
Fabrizio Jordan Arias Marca
📧 ariasjordan943@gmail.com
🌐 jordandeveloper.netlify.app
