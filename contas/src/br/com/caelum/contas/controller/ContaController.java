package br.com.caelum.contas.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.caelum.contas.dao.ContaDAO;
import br.com.caelum.contas.modelo.Conta;

@Controller
public class ContaController {
	 
	
	@RequestMapping(value="/form")
    public String form() {
        return "/conta/formulario";
    }
	
	@RequestMapping("/adicionaConta")
	public String adiciona(@Valid Conta conta, BindingResult result) {

		if(result.hasErrors()){
			return "/conta/formulario";
		}
		
		ContaDAO dao = new ContaDAO();
		dao.adiciona(conta);
		return "/conta/conta-adicionada";

	}
	
	@RequestMapping("/listaContas")
	public ModelAndView lista(){
		
		ContaDAO dao = new ContaDAO();
		ModelAndView mv = new ModelAndView("conta/lista");
		mv.addObject("contas",dao.lista());
		return  mv;
		
	}
	
//	@RequestMapping("/listaContas")
//	public String lista(Model mv) {
//	  ContaDAO dao = new ContaDAO();
//	  List<Conta> contas = dao.lista();
//
//	  mv.addAttribute("contas", contas);
//	  return "conta/lista";
//	}
//	
	
	
}
