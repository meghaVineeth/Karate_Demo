function fn() {
    karate.configure('readTimeout',1500000);

    karate.configure('ssl',true);

    var env = karate.env;

    var env = 'UAT';

    if (!env){
        env = 'SIT';
    }

    karate.log ('karate env is set to: ', env);

    var config =
    {
        baseURL:   'https://reqres.in/',
        apiPath:   'api/users'

    }

    if( env == 'UAT'){
        config.apiPath = 'api/users/2';
    }

    return config;

 }