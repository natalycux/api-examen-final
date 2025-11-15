# ?? GUÍA COMPLETA EXAMEN FINAL - BACKEND + FRONTEND

## ?? INFORMACIÓN DEL EXAMEN

### ?? **OBJETIVO:**
Crear un sistema completo con:
- ? **Base de datos** (SQL Server - te la proporcionan)
- ? **Backend API** (.NET, Node.js u otro)
- ? **Frontend** (consume la API)
- ? **TODO publicado online** (funcionando en producción)

### ?? **TIEMPO TOTAL DEL EXAMEN:**
*(Por confirmar con el profesor - estima 2-3 horas)*

### ?? **DISTRIBUCIÓN DEL TIEMPO:**
Asumiendo 2 horas (120 minutos):
- Backend API: **45 min** (40%)
- Frontend: **50 min** (40%)
- Deployment: **15 min** (15%)
- Buffer: **10 min** (5%)

---

## ?? FLUJO COMPLETO DEL EXAMEN

```
???????????????     ???????????????     ???????????????     ???????????????
? BD SQL      ? ??> ? API .NET    ? ??> ? Frontend    ? ??> ? Deploy      ?
? (Te la dan) ?     ? (Crear)     ?     ? (Crear)     ?     ? (Publicar)  ?
???????????????     ???????????????     ???????????????     ???????????????
                           ?                    ?                    ?
                           ?                    ?                    ?
                        Azure              Vercel/Netlify         Online
                     Web App               GitHub Pages         Funcionando
```

---

## ?? PARTE 1: BACKEND API (45 minutos)

### Ya está cubierto en:
- **`GUIA_EXAMEN_BD_EXISTENTE.md`** ? ? Usa esta (BD ya existe)

### Resumen rápido:
1. Te dan cadena de conexión a SQL Server
2. Creas modelo C# que mapea la tabla
3. Creas controlador con CRUD
4. Pruebas localmente (Swagger)
5. Subes a GitHub
6. Auto-deploy a Azure Web App
7. Verificas: `https://tu-api.azurewebsites.net/swagger`

**? Backend listo** ? Pasa al frontend

---

## ?? PARTE 2: FRONTEND (50 minutos)

### ?? **OPCIONES DE TECNOLOGÍA**

Elige la que mejor conozcas:

#### Opción A: HTML + JavaScript Vanilla (Más simple)
- ? Rápido de implementar
- ? Sin dependencias
- ? Perfecto para el examen
- ?? **Recomendado si tienes poco tiempo**

#### Opción B: React
- ? Componentizado
- ? Manejo de estado
- ?? Requiere más tiempo

#### Opción C: Vue.js
- ? Simple y reactivo
- ? Buena alternativa a React

#### Opción D: Angular
- ?? Más complejo
- ?? Solo si lo dominas muy bien

---

## ?? PARTE 2.1: FRONTEND CON HTML + JAVASCRIPT (RECOMENDADO)

### Estructura del proyecto:
```
frontend/
??? index.html          ? Página principal
??? styles.css          ? Estilos
??? app.js              ? Lógica (consume API)
??? README.md           ? Opcional
```

### 1?? **index.html** (Estructura)

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Productos</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>?? Gestión de Productos</h1>
        
        <!-- Formulario para crear/editar -->
        <div class="form-section">
            <h2>Agregar Producto</h2>
            <form id="productForm">
                <input type="hidden" id="productId">
                
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" required>
                </div>
                
                <div class="form-group">
                    <label for="descripcion">Descripción:</label>
                    <textarea id="descripcion"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="precio">Precio:</label>
                    <input type="number" id="precio" step="0.01" required>
                </div>
                
                <div class="form-group">
                    <label for="stock">Stock:</label>
                    <input type="number" id="stock" required>
                </div>
                
                <button type="submit" id="btnSubmit">Agregar</button>
                <button type="button" id="btnCancel" style="display:none;">Cancelar</button>
            </form>
        </div>
        
        <!-- Lista de productos -->
        <div class="products-section">
            <h2>Lista de Productos</h2>
            <div id="loading">Cargando productos...</div>
            <div id="error" style="display:none;"></div>
            <table id="productsTable" style="display:none;">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody id="productsBody">
                    <!-- Se llenará con JavaScript -->
                </tbody>
            </table>
        </div>
    </div>
    
    <script src="app.js"></script>
</body>
</html>
```

---

### 2?? **styles.css** (Estilos básicos)

```css
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    min-height: 100vh;
    padding: 20px;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    background: white;
    border-radius: 10px;
    padding: 30px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.3);
}

h1 {
    color: #333;
    text-align: center;
    margin-bottom: 30px;
}

h2 {
    color: #667eea;
    margin-bottom: 20px;
}

/* Formulario */
.form-section {
    background: #f8f9fa;
    padding: 20px;
    border-radius: 8px;
    margin-bottom: 30px;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    color: #555;
    font-weight: 600;
}

.form-group input,
.form-group textarea {
    width: 100%;
    padding: 10px;
    border: 2px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
}

.form-group input:focus,
.form-group textarea:focus {
    outline: none;
    border-color: #667eea;
}

button {
    background: #667eea;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    margin-right: 10px;
    transition: background 0.3s;
}

button:hover {
    background: #5568d3;
}

#btnCancel {
    background: #6c757d;
}

#btnCancel:hover {
    background: #5a6268;
}

/* Tabla */
.products-section {
    margin-top: 30px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

thead {
    background: #667eea;
    color: white;
}

th, td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

tbody tr:hover {
    background: #f8f9fa;
}

.btn-edit {
    background: #28a745;
    color: white;
    padding: 5px 10px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    margin-right: 5px;
}

.btn-delete {
    background: #dc3545;
    color: white;
    padding: 5px 10px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}

#loading, #error {
    text-align: center;
    padding: 20px;
    font-size: 18px;
}

#error {
    color: #dc3545;
    background: #f8d7da;
    border: 1px solid #f5c6cb;
    border-radius: 5px;
}

/* Responsive */
@media (max-width: 768px) {
    .container {
        padding: 15px;
    }
    
    table {
        font-size: 12px;
    }
    
    th, td {
        padding: 8px;
    }
}
```

---

### 3?? **app.js** (Lógica - CONECTA CON TU API)

```javascript
// ?? IMPORTANTE: Cambia esta URL por la de tu API en Azure
const API_URL = 'https://tu-api.azurewebsites.net/api/Productos';
// Para desarrollo local usa: 'https://localhost:7209/api/Productos'

// Elementos del DOM
const form = document.getElementById('productForm');
const productsBody = document.getElementById('productsBody');
const productsTable = document.getElementById('productsTable');
const loading = document.getElementById('loading');
const errorDiv = document.getElementById('error');
const btnSubmit = document.getElementById('btnSubmit');
const btnCancel = document.getElementById('btnCancel');

// Variables de estado
let isEditing = false;
let editingId = null;

// Cargar productos al iniciar
document.addEventListener('DOMContentLoaded', loadProducts);

// Event listeners
form.addEventListener('submit', handleSubmit);
btnCancel.addEventListener('click', cancelEdit);

// ========================================
// FUNCIONES PRINCIPALES
// ========================================

// Cargar todos los productos (GET)
async function loadProducts() {
    try {
        loading.style.display = 'block';
        errorDiv.style.display = 'none';
        productsTable.style.display = 'none';
        
        const response = await fetch(API_URL);
        
        if (!response.ok) {
            throw new Error(`Error: ${response.status} - ${response.statusText}`);
        }
        
        const products = await response.json();
        
        loading.style.display = 'none';
        
        if (products.length === 0) {
            productsBody.innerHTML = '<tr><td colspan="6" style="text-align:center;">No hay productos</td></tr>';
        } else {
            displayProducts(products);
        }
        
        productsTable.style.display = 'table';
        
    } catch (error) {
        loading.style.display = 'none';
        showError('Error al cargar productos: ' + error.message);
    }
}

// Mostrar productos en la tabla
function displayProducts(products) {
    productsBody.innerHTML = '';
    
    products.forEach(product => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${product.id}</td>
            <td>${product.nombre}</td>
            <td>${product.descripcion || '-'}</td>
            <td>$${product.precio.toFixed(2)}</td>
            <td>${product.stock}</td>
            <td>
                <button class="btn-edit" onclick="editProduct(${product.id})">Editar</button>
                <button class="btn-delete" onclick="deleteProduct(${product.id})">Eliminar</button>
            </td>
        `;
        productsBody.appendChild(row);
    });
}

// Crear o actualizar producto (POST / PUT)
async function handleSubmit(e) {
    e.preventDefault();
    
    const producto = {
        nombre: document.getElementById('nombre').value,
        descripcion: document.getElementById('descripcion').value,
        precio: parseFloat(document.getElementById('precio').value),
        stock: parseInt(document.getElementById('stock').value)
    };
    
    try {
        let response;
        
        if (isEditing) {
            // PUT - Actualizar
            producto.id = editingId;
            response = await fetch(`${API_URL}/${editingId}`, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(producto)
            });
            
            if (response.ok || response.status === 204) {
                showSuccess('Producto actualizado correctamente');
            }
        } else {
            // POST - Crear
            response = await fetch(API_URL, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(producto)
            });
            
            if (response.ok || response.status === 201) {
                showSuccess('Producto creado correctamente');
            }
        }
        
        if (!response.ok && response.status !== 204) {
            throw new Error(`Error: ${response.status}`);
        }
        
        form.reset();
        cancelEdit();
        loadProducts();
        
    } catch (error) {
        showError('Error al guardar producto: ' + error.message);
    }
}

// Editar producto
async function editProduct(id) {
    try {
        const response = await fetch(`${API_URL}/${id}`);
        
        if (!response.ok) {
            throw new Error(`Error: ${response.status}`);
        }
        
        const product = await response.json();
        
        // Llenar el formulario
        document.getElementById('productId').value = product.id;
        document.getElementById('nombre').value = product.nombre;
        document.getElementById('descripcion').value = product.descripcion || '';
        document.getElementById('precio').value = product.precio;
        document.getElementById('stock').value = product.stock;
        
        // Cambiar a modo edición
        isEditing = true;
        editingId = id;
        btnSubmit.textContent = 'Actualizar';
        btnCancel.style.display = 'inline-block';
        
        // Scroll al formulario
        document.querySelector('.form-section').scrollIntoView({ behavior: 'smooth' });
        
    } catch (error) {
        showError('Error al cargar producto: ' + error.message);
    }
}

// Eliminar producto (DELETE)
async function deleteProduct(id) {
    if (!confirm('¿Estás seguro de eliminar este producto?')) {
        return;
    }
    
    try {
        const response = await fetch(`${API_URL}/${id}`, {
            method: 'DELETE'
        });
        
        if (response.ok || response.status === 204) {
            showSuccess('Producto eliminado correctamente');
            loadProducts();
        } else {
            throw new Error(`Error: ${response.status}`);
        }
        
    } catch (error) {
        showError('Error al eliminar producto: ' + error.message);
    }
}

// Cancelar edición
function cancelEdit() {
    isEditing = false;
    editingId = null;
    form.reset();
    btnSubmit.textContent = 'Agregar';
    btnCancel.style.display = 'none';
}

// Mostrar error
function showError(message) {
    errorDiv.textContent = message;
    errorDiv.style.display = 'block';
    setTimeout(() => {
        errorDiv.style.display = 'none';
    }, 5000);
}

// Mostrar éxito
function showSuccess(message) {
    const successDiv = document.createElement('div');
    successDiv.textContent = message;
    successDiv.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        background: #28a745;
        color: white;
        padding: 15px 20px;
        border-radius: 5px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        z-index: 1000;
    `;
    document.body.appendChild(successDiv);
    
    setTimeout(() => {
        successDiv.remove();
    }, 3000);
}
```

---

## ?? PARTE 3: DEPLOYMENT (15 minutos)

### ?? **OPCIÓN 1: Deploy con GitHub Pages (Gratis + Fácil)**

#### Paso 1: Subir frontend a GitHub
```bash
# Crea un nuevo repositorio en GitHub llamado: frontend-examen-final

# En tu carpeta frontend:
cd frontend
git init
git add .
git commit -m "Frontend inicial"
git remote add origin https://github.com/TU-USUARIO/frontend-examen-final.git
git branch -M main
git push -u origin main
```

#### Paso 2: Activar GitHub Pages
1. Ve a tu repositorio en GitHub
2. **Settings** ? **Pages**
3. Source: **Deploy from a branch**
4. Branch: **main** / **root**
5. **Save**
6. Espera 1-2 minutos
7. Tu sitio estará en: `https://TU-USUARIO.github.io/frontend-examen-final/`

? **Listo! Frontend publicado**

---

### ?? **OPCIÓN 2: Deploy con Vercel (Recomendado)**

#### Paso 1: Instalar Vercel CLI
```bash
npm install -g vercel
```

#### Paso 2: Deploy
```bash
cd frontend
vercel
```

Sigue las instrucciones:
- Login con GitHub
- Link to existing project? **No**
- Project name: `frontend-examen-final`
- Enter para aceptar defaults

? **Te da una URL instantánea**: `https://frontend-examen-final.vercel.app`

---

### ?? **OPCIÓN 3: Deploy con Netlify**

#### Opción A: Netlify Drop (más fácil)
1. Ve a https://app.netlify.com/drop
2. Arrastra tu carpeta `frontend/`
3. ? **Listo! Te da una URL**

#### Opción B: Netlify CLI
```bash
npm install -g netlify-cli
cd frontend
netlify deploy --prod
```

---

## ?? CHECKLIST COMPLETO DEL EXAMEN

### ? BACKEND (45 min)
- [ ] Obtener cadena de conexión de la BD
- [ ] Crear modelo C# que mapea la tabla
- [ ] Actualizar DbContext
- [ ] Crear/actualizar controlador CRUD
- [ ] Probar localmente (Swagger)
- [ ] Subir a GitHub
- [ ] Verificar deployment en Azure
- [ ] Swagger funciona online
- [ ] **URL Backend**: `https://_____.azurewebsites.net/swagger`

### ? FRONTEND (50 min)
- [ ] Crear estructura HTML
- [ ] Agregar estilos CSS
- [ ] Implementar lógica JavaScript
- [ ] Conectar con API (actualizar `API_URL`)
- [ ] Probar localmente (Live Server)
- [ ] GET muestra productos
- [ ] POST crea productos
- [ ] PUT actualiza productos
- [ ] DELETE elimina productos
- [ ] Subir a GitHub
- [ ] Deploy (GitHub Pages / Vercel / Netlify)
- [ ] **URL Frontend**: `https://_____.github.io/...`

### ? INTEGRACIÓN (5 min)
- [ ] Frontend se conecta a API en Azure
- [ ] Configurar CORS en la API (si hay errores)
- [ ] Todas las operaciones CRUD funcionan
- [ ] No hay errores en consola del navegador

### ? ENTREGA (5 min)
- [ ] URL Backend funcionando
- [ ] URL Frontend funcionando
- [ ] Ambos repositorios en GitHub
- [ ] Captura de pantalla (opcional)
- [ ] Video demo (opcional)

---

## ?? CONFIGURAR CORS EN LA API (IMPORTANTE)

Si el frontend da error de CORS, agrega esto en `Program.cs`:

```csharp
// En Program.cs, ANTES de var app = builder.Build();

builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll",
        builder =>
        {
            builder.AllowAnyOrigin()
                   .AllowAnyMethod()
                   .AllowAnyHeader();
        });
});

var app = builder.Build();

// DESPUÉS de var app = builder.Build();
app.UseCors("AllowAll");
```

Luego:
```bash
git add .
git commit -m "Agregar CORS"
git push
```

---

## ?? ESTRATEGIA DE TIEMPO

### Si tienes 2 horas (120 min):
1. **0-45 min**: Backend completo y en Azure ?
2. **45-95 min**: Frontend completo ?
3. **95-105 min**: Deploy frontend ?
4. **105-115 min**: Pruebas integración ?
5. **115-120 min**: Entrega URLs ?

### Si tienes 3 horas (180 min):
Más tiempo para pulir y agregar features extra

---

## ?? TIPS FINALES

1. **Empieza por el backend** - Es la base
2. **Prueba cada parte antes de continuar**
3. **Guarda las URLs** a medida que las obtienes
4. **Si algo falla**, no pierdas tiempo - usa la versión local y explica al profesor
5. **Frontend simple es mejor** que uno complejo sin terminar
6. **Usa las plantillas** de código que te proporcioné
7. **Ten los comandos a mano** (COMANDOS_RAPIDOS.md)

---

## ?? PLAN B

Si algo falla en deployment:
1. **Backend local**: Graba video mostrando Swagger funcionando
2. **Frontend local**: Graba video mostrando el CRUD completo
3. **Explica al profesor** qué salió mal y muestra tu código en GitHub

---

**?? ¡ÉXITO EN TU EXAMEN COMPLETO! ??**

**URLs de entrega:**
- Backend: `https://_____.azurewebsites.net/swagger`
- Frontend: `https://_____.github.io/...` o Vercel/Netlify
- GitHub Backend: `https://github.com/TU-USUARIO/api-examen-final`
- GitHub Frontend: `https://github.com/TU-USUARIO/frontend-examen-final`
