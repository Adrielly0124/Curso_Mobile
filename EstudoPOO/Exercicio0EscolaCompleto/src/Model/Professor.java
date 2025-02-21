package Model;

public class Professor extends Pessoa {
    //atributo
    private Double salario;

    //construtor
    public Professor(String nome, String cpf, Double salario) {
        super(nome, cpf);
        this.salario = salario;
    }
 
    //getters and setters
    public Double getSalario() {
        return salario;
    }

    public void setSalario(Double salario) {
        this.salario = salario;
    }
    //sobreEscrita do método ExibirInformações
    @Override
    public void exibirInformacoes(){
        super.exibirInformacoes();
        System.out.println("Salário: R$" +salario);
    }
}