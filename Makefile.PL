use inc::Module::Install;
name 'App-ScriptTemplate';
all_from 'lib/App/ScriptTemplate.pm';

# requires '';
requires 

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
