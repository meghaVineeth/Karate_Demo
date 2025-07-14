mvn test -Dtest=e2eRunner -Dargline="-Dkarate.env=UAT"

mvn test "-Dkarate.options=--tags @Jenkins" -Dtest=e2eRunner

