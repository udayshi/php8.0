<?php


namespace App\Controller;


use Psr\Log\LoggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomePageController extends AbstractController
{
    /**
     * @Route("/",name="demo_home")
     */
        public function demo(LoggerInterface $logger){
           #return new Response('Hello World');

            $logger->info('Hello world');
           return $this->render('demo/demo.html.twig');
        }

    /**
     * @Route("/input/{input}",name="input")
     */

        public function demoInput($input,LoggerInterface $l){
          $l->info('Hello world');
            return new Response('Name: '.$input);
        }
}