# 📱 Aplicación Flutter - Pantalla de Login y Cadastro

## 📌 Descripción

Este proyecto consiste en el desarrollo de una aplicación en Flutter que implementa una pantalla de login y una segunda pantalla de cadastro de usuario.

El objetivo es aplicar conceptos fundamentales de desarrollo de interfaces gráficas utilizando widgets de Flutter, así como la navegación entre pantallas y validación de datos.

---

## 🚀 Funcionalidades

### 🔐 Pantalla de Login

- Imagen representada mediante un `CircleAvatar` con ícono
- Campo de texto para nombre de usuario
- Campo de texto para contraseña
- Botón para mostrar y ocultar la contraseña
- Botón de inicio de sesión (`ElevatedButton`)
- Validación de datos mediante `if/else`
- Mensajes de error utilizando `SnackBar`
- Navegación a la siguiente pantalla si las credenciales son correctas

📌 Credenciales de prueba:
- Usuario: `admin`
- Contraseña: `1234`

---

### 📝 Pantalla de Cadastro

- Mensaje de bienvenida personalizado
- Campos para ingresar datos del usuario:
  - Nombre
  - Dirección
  - Curso
  - Ciudad
  - País
- Botón para guardar los datos
- Visualización de la información mediante `AlertDialog`
- Botón para volver a la pantalla de login

---

## 🧱 Tecnologías utilizadas

- Flutter
- Dart
- Material Design

---

## 🧩 Widgets utilizados

Durante el desarrollo se utilizaron los siguientes widgets:

- `Scaffold`
- `AppBar`
- `Column`
- `Row`
- `Container`
- `Text`
- `TextField`
- `ElevatedButton`
- `SizedBox`
- `CircleAvatar`
- `Icon`
- `SnackBar`
- `AlertDialog`
- `StatefulWidget`
- `StatelessWidget`

---

## 🔄 Navegación

La navegación entre pantallas se realiza utilizando:

```dart
Navigator.push()
Navigator.pop()
