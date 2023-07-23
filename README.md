<a name="readme-top"></a>

### <div align="center"><a href="https://github.com/Benawi"><img src="https://github.com/Benawi/Benawi/assets/21217148/de823737-5f7f-4de8-b62e-3fe88c238eab"/></a>

 </div> 
<div align="center">🛰Vet-clinic-database🚀</div>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
   <!--  - [Live Demo](#live-demo)
    - [Walkthrough](#Walkthrough) -->
- [💻 Getting Started](#getting-started)
  <!-- - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests) -->
  <!-- - [Deployment](#triangular_flag_on_post-deployment) -->
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)

- [📝 License](#license)

# 📖 Vet-clinic-database  <a name="about-project"></a>
This repository includes files with plain SQL that can be used to recreate a database:

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database. 
## 🛠 Built With <a name="built-with"></a>

## Tech Stack <a name="tech-stack"></a>

<ul>

  <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  <!-- <li><a href="https://microverse.notion.site/HTML-CSS-Get-a-head-start-275eb85fd34b4416aa06ec635d69cdaf">HTML</a></li>
  <li><a href="https://microverse.notion.site/HTML-CSS-Get-a-head-start-275eb85fd34b4416aa06ec635d69cdaf">CSS</a></li>
      <li><a href="https://microverse.notion.site/HTML-CSS-Get-a-head-start-275eb85fd34b4416aa06ec635d69cdaf">JS</a></li>
      <li><a href="https://react.dev/learn/start-a-new-react-project#create-react-app">React </a></li>
       <li><a href="https://react-redux.js.org/">React Redux</a>
        <li><a href="https://www.npmjs.com/package/redux-logger">Redux Logger</a></li>
         <li><a href="https://github.com/microverseinc/curriculum-react-redux/blob/main/math-magicians/articles/react_router.md">React Router</a></li> -->
         
</ul>

## 🔑 Key Features <a name="key-features"></a>

### Vet-clinic-database [Requirements](https://github.com/microverseinc/curriculum-databases/blob/main/db-structure/sneak_peek.md)

- [x] Populate data to the table
- [x] Transactions allow making changes in isolation and rolling back if needed
- [x] Demonstrates BEGIN TRANSACTION, COMMIT, and ROLLBACK
- [x] Allows verifying changes before committing
- [x] Demonstrates deleting subsets of rows
- [x] Creates a savepoint within a transaction
- [x] Allows rolling back to a mid-transaction savepoint
- [x] Basic aggregation queries like COUNT, AVG, MIN, and MAX functions
- [x] Conditional filtering WHERE clause to filter result setg, group results by a column like animal type and apply aggregates per group
- [x] `owners` table to store owner information
- [x] `species` table to store animal species
- [x] `animals` table to store animal data, with foreign keys linking to owners and species
- [x] Queries implemented using SQL JOINS to answer questions like:
  - What animals belong to an owner
  - List animals by species
  - List owners and their animals
  - Count animals per species
  - Other analytics like most owned animals
- [x] Apply types of relationships between tables
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>

### 👤 Habtamu Alemayehu

- GitHub: [Benawi](https://github.com/Benawi)
- Linkdin: [Habtamu](https://www.linkedin.com/in/habtamualemayehu/)

## 🔭 Future Features <a name="future-features"></a>
- Database performance audit.💯
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, [issues](https://github.com/Benawi/Vet-clinic-database/issues), and feature requests are welcome!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

Give me ⭐️ If you like this project!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

- I  thank the Microverse program for giving us this great chance.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./MIT.md) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
