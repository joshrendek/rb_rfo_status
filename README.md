# Installation

Download the .war file and deploy it in your favorite container (Tomcat, etc). Once the war file is extracted you can modify the config settings.

To run migrations on an extracted WAR file:

```
sudo RAILS_ENV=production BUNDLE_WITHOUT=development:test BUNDLE_GEMFILE=Gemfile GEM_HOME=gems java -cp lib/jruby-core-1.7.1.jar:lib/jruby-stdlib-1.7.1.jar:lib/gems-gems-activerecord-jdbc-adapter-1.2.2.1-lib-arjdbc-jdbc-adapter_java.jar:lib/gems-gems-jdbc-mysql-5.1.13-lib-mysql-connector-java-5.1.13.jar org.jruby.Main -S rake db:migrate
```

# Cacheing

THe main page and invidual status's are cached for 5 minutes (or when a new status or update is made, whichever comes first).

# Extra configuration 

## Environment variables 

### PagerDuty 

Setting these environment variables will let you integrate with your PagerDuty account to have incidents linked to a status.

PAGEDUTY_KEY: your API key
PAGEDUTY_DOMAIN: your pager duty subdomain


