package br.com.caelum.contas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OlaMundoController {

	@RequestMapping(value="/olaMundoSpring")
	public String executa(){
		System.out.println("Mensagem no console atraves do controller ola mundo");
		return "ola-mundo";
	}
	
}