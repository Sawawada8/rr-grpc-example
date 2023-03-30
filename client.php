<?php

// declare(strict_types=1);
use \Service\Message as Mes;

require __DIR__.'/vendor/autoload.php';


$client = new \Service\EchoClient('0.0.0.0:9001', [
    'credentials' => \Grpc\ChannelCredentials::createInsecure(),
]);

// $message = new \Service\Message();
$message = new Mes();
$message->setMsg('PING');

[$response, $status] = $client->Ping($message)->wait();

echo $response->getMsg() . PHP_EOL;
