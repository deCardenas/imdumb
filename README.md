# 🎬 IMDUMB App (Flutter)

[@Diego Cárdenas Díaz](https://www.linkedin.com/in/decardenasd/)

Aplicación móvil de películas desarrollada en **Flutter**, siguiendo **Clean
Architecture**, con manejo de estado mediante **Riverpod**, navegación tipada
con **go_router + go_router_builder**, consumo de APIs con **Dio**,
configuración remota mediante **Firebase Remote Config** , persistencia local
con **SharedPreferences** y base de datos con **Hive**. Adicionalmente\
para el registro de errores **Firebase Crashlytics** y tracking de pantallas
**Firebase Analytics**

## 📑 Tabla de Contenidos

- [Arquitectura](#-arquitectura)
- [Tecnologías principales](#-tecnologías-principales)
- [Dependencias](#-dependencias)
- [Navegación](#-navegación)
- [Pantallas y Funcionalidades](#-pantallas-y-funcionalidades)
  - [Splash](#-splash)
  - [Inicio](#-inicio)
  - [Explora](#-explora)
  - [Favorites](#-favorites)
  - [Detail](#-detail)
- [API de Películas](#-api-de-películas)
- [Testing](#-testing-preparado)
- [Setup & Ejecución](#-setup--ejecución)
  - [Requisitos previos](#-requisitos-previos)
  - [Clonar el proyecto](#-clonar-el-proyecto)
  - [Firebase (Remote Config)](#firebase-remote-config)
  - [Instalar dependencias](#-instalar-dependencias)
  - [Ejecutar la aplicación](#-ejecutar-la-aplicación)
- [Principios SOLID](#-solid)

---

## 🧱 Arquitectura

El proyecto sigue **Clean Architecture** con separación clara por capas y por
features:

- **Presentation** → Pages, Widgets, Notifiers (Riverpod)
- **Domain** → Entities, UseCases, contratos de Repositorios, Providers
- **Data** → Repositorios, DataSources, DataStores, Models, Mappers, Providers

Estructura basada en **feature-first**, pensada para escalar y facilitar
testing.

La app combina **persistencia local y remota**:

- **Shared Preferences** para configuraciones locales (flags, preferencias de
  UI)
- **Hive** para almacenamiento estructurado de datos (películas favoritas)
- **The Movie Database (TMDB)** como fuente principal de datos remotos

---

## 🛠️ Tecnologías principales

- Flutter 3.38.5
- Riverpod (AsyncNotifier / Provider)
- go_router + go_router_builder (rutas tipadas)
- Dio (HTTP client)
- Firebase Remote Config
- **Shared Preferences** (configuración local ligera)
- **Hive** (persistencia local de películas favoritas)
- **The Movie Database (TMDB) API**

---

## 📦 Dependencias

A continuación se muestran las dependencias principales necesarias para ejecutar
el proyecto:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter

  cupertino_icons: 1.0.8
  firebase_remote_config: 6.1.3
  firebase_crashlytics: 5.0.6
  firebase_analytics: 12.1.0
  firebase_core: 4.3.0
  dio: 5.9.0
  flutter_riverpod: 3.1.0
  go_router: 17.0.1
  riverpod_annotation: ^4.0.0
  flutter_animate: ^4.5.2
  shared_preferences: ^2.5.4
  carousel_slider: ^5.1.1
  hive: ^2.2.3
  path_provider: ^2.1.5

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.10.4

  flutter_lints: 6.0.0
  flutter_launcher_icons: 0.14.4
  go_router_builder: 4.1.3
  flutter_gen_runner: 5.12.0
  riverpod_generator: 4.0.0+1
```

> ⚠️ **Nota:** Las versiones pueden ajustarse según la versión de Flutter
> utilizada.

---

## 🧭 Navegación

La app utiliza **go_router con rutas tipadas** y soporte para **deep links**.

Flujo general:

```
Splash  → Inicio    → 
        → Explore   → Detail -> Recomendar (Modal)
        → Favorites →
```

---

## 📱 Pantallas y Funcionalidades

### 🚀 Splash

**Responsabilidad:** Inicialización de la aplicación

Funciones:

- Inicializa Firebase Remote Config
- Carga configuración global

---

### 🏠 Inicio

**Responsabilidad:** Pantalla principal de descubrimiento

Funciones:

- Muestra una **lista vertical de géneros**
- Por cada género, muestra una **lista horizontal de películas**
- Permite navegar al detalle de una película
- Soporte para **paginación**
- Permite **scroll infinito**

Ejemplo visual:

```
Acción
  [Movie] [Movie]

Drama
  [Movie] [Movie]
```

---

### 🔎 Explora

**Responsabilidad:** Exploración avanzada de películas

Funciones:

- Muestra una lista de películas
- Permite seleccionar una **categoría** desde un selector:

  - En cartelera
  - Populares
  - Más valorados
  - Próximos lanzamientos
- Permite cambiar la **orientación de las cards**:

  - Horizontal
  - Vertical
- Permite navegar al detalle de una película
- Soporte para **paginación**
- Permite **scroll infinito**
- Permite **añadir / quitar películas de favoritos**

Ejemplo visual card vertical:

```
[Movie] [Movie]
[Movie] [Movie]
```

Ejemplo visual card horizontal:

```
[Movie] 
[Movie]
[Movie] 
[Movie]
```

---

### ❤️ Favorites

**Responsabilidad:** Gestión de películas favoritas

Funciones:

- Muestra una lista de películas marcadas como favoritas
- Persistencia local usando **Hive**
- Acceso rápido al detalle de la película
- Permite eliminar de favoritos

---

### 🎞️ Detail

**Responsabilidad:** Detalle de la película

Funciones:

- Muestra información detallada:

  - Título
  - Año
  - Duración
  - Poster
  - Descripción
  - Puntuación promedio
  - Actores (Imagen, Nombre, Personaje)
- Acceso desde Home, Explore y Favorites

Ejemplo visual card horizontal:

```
[Imagen Principal] 
[Año] [Duración] [Puntuación promedio]
[Categoría] [Categoría] [Categoría] 
[Titulo]
[Descripción]
[Carousel de imágenes]
[Actores]
[Recomendar]
```

---

## 🌐 API de Películas

La aplicación consume datos desde **The Movie Database (TMDB)**, incluyendo:

- Lista de géneros
- Películas por género
- Listas de películas por categoría
  - En cartelera
  - Populares
  - Más valorados
  - Próximos lanzamientos
- Detalle de película
- Imágenes de película
- Créditos de película (Actores)

La integración se realiza mediante **Dio**, desacoplado a través de un
`ApiClient` para facilitar testing y mantenimiento.

---

## 🧪 Testing (Preparado)

La arquitectura permite testing sencillo de:

- UseCases
- Repositorios (mockeando ApiClient)
- Providers de Riverpod
- Rutas y redirects

---

## 🚀 Setup & Ejecución

#### 📋 Requisitos previos

Asegúrate de tener instalado:

- Flutter SDK (3.85.5)
- Dart (incluido con Flutter)
- Git
- Android Studio / VS Code (opcional pero recomendado)
- Un emulador Android, iOS Simulator o dispositivo físico

Verifica Flutter con:

```bash
flutter doctor
```

---

#### 📥 Clonar el proyecto

Clona el repositorio desde Git:

```bash
git clone https://github.com/deCardenas/imdumb.git
```

Ingresa al directorio del proyecto:

```bash
cd imdumb
```

---

#### Firebase (Remote Config)

Para modificar los datos de Remote Config solicitar acceso al correo
dcardenaspro@gmail.com

**Las configuraciones ingresadas en Remote Config son unicamente para la primera
vez que se ingresa a la aplicación**

---

#### 📦 Instalar dependencias

Ejecuta el siguiente comando para descargar todas las dependencias:

```bash
flutter pub get
```

---

#### ▶️ Ejecutar la aplicación

Con un emulador o dispositivo conectado, ejecuta:

```bash
flutter run
```

O desde tu IDE (Android Studio / VS Code) usando el botón ▶️.

---

## 🧱 SOLID

Este proyecto aplica los principios SOLID como base para lograr un código
mantenible, escalable, testeable y desacoplado, alineado con Clean Architecture
y buenas prácticas en Flutter.

- **Single Responsibility Principle (SRP)**: Una clase debe tener una sola razón
  para cambiar.
- **Open / Closed Principle (OCP)**: Las entidades de software deben estar
  abiertas para extensión, pero cerradas para modificación.
- **Liskov Substitution Principle (LSP)**: Las subclases deben poder sustituir a
  sus clases base sin alterar el comportamiento esperado.
- **Interface Segregation Principle (ISP)**: Los clientes no deben depender de
  interfaces que no utilizan.
- **Dependency Inversion Principle (DIP)**: Los módulos de alto nivel no deben
  depender de módulos de bajo nivel, ambos deben depender de abstracciones.

**Archivos que contienen los principios SOLID**

```
- lib
  - core
    - client
      - api_client.dart
      - dio_client.dart
  - features
    - movies
      - 02_domain
        - repositories
          - i_favorite_movie_repository.dart
          - i_movies_repository.dart
        - use_cases
          - add_favorite_movie_use_case.dart
          - get_favorite_movies_use_case.dart
          - get_genres_use_case.dart
          - get_movie_credits_use_case.dart
          - get_movie_detail_use_case.dart
          - get_movie_images_use_case.dart
          - get_movie_list_use_case.dart
          - get_movies_by_genre_use_case.dart
          - is_favorite_movie_use_case.dart
          - remove_favorite_movie_use_case.dart
      - 03_data
        - data_sources
          - base_remote_data_source.dart
          - movies_remote_data_source.dart
        - mappers
          - credits_response_mapper.dart
          - genre_model_mapper.dart
          - movie_detail_model_mapper.dart
        - models
          - genres_response.dart
```
