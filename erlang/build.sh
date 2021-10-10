mkdir -p out
erlc -o out src/pythagoreanseries.erl
erlc -I src -o out test/pythagoreanseries_tests.erl
erl -noshell -pa out -s pythagoreanseries_tests test -s init stop
/bin/rm -rf out