<?php
$servername = getenv('DB_HOST');
$dbName = getenv('DB_NAME');
$username = getenv('DB_USER');
$password = getenv('DB_PASSWORD');
try {
  //  $conn = new PDO("mysql:host=$servername;dbname=$dbName", $username, $password);
    $conn = new PDO("pgsql:host=$servername;dbname=$dbName", $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Database is Connected successfully";
}
catch(PDOException $e)
{
    echo "Connection failed: " . $e->getMessage();
}

$mc = new Memcached('mc');
$mc->setOption(Memcached::OPT_LIBKETAMA_COMPATIBLE, true);
$check = $mc->addServer(getenv('DOMAIN_MEMCACHE'), getenv('MEMCACHE_PORT_DOCKER'));
echo "<br /> Memcached is connected: $check";
