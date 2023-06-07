- cte
    with <name of result set> ([col_names])
    AS
    (
        <cte_query>
    )
    <reference_the_cte>
- cat ~/.dbt/profiles.yml
- dbt run
    - run all models in datawarehouse
- dbt run --select src_hosts+
    - run specific model and all upstream models in datawarehouse
- dbt run --full-refresh
    - run full refresh for incremental models
- dbt docs generate
    - generate documentation in target folder as catalog.json
- dbt docs serve
    - serve documentation on light weight documentation server
- dbt deps
    - install packages listed in the packages.yml file
- dbt debug
    - provide configuration, depedencies and datawarehouse connection details
- dbt source freshness
    - display freshness for each of your sources in sources.yml file
- dbt clean
    - folders in clean target will be removed
- dbt compile
    - syntax and compilation checks on your dbt project files without actually executing the transformations and store in target dir
- dbt test
    - run all your tests in schema or sources.yml file or test folder
- dbt seed
    - read the seed files defined in your dbt project, parse the data, and insert it into the corresponding tables in your data warehouse
- dbt test --select source:airbnb.listings
    - run all your tests that use source:airbnb.listings
- dbt test --select dim_listings_w_hosts
    - run all your tests that use dim_listings_w_hosts
- dbt --debug test --select source:airbnb.listings
    - run all your tests that use source:airbnb.listings and generates more output for issue debugging