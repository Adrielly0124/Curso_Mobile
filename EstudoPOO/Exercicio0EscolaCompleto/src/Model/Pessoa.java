package Model;

public abstract class Pessoa {
    //atributos privados (encapsulamento) protegidos - garante maior segurança pra classe, deixar os atributos privados e os metodos publicos
    private String nome;
    private String cpf;
    //métodos publicos
    //construtor
    public Pessoa(String nome, String cpf) {
        this.nome = nome;
        this.cpf = cpf;
    }
    //getter(pegar as informações - métodos publicos) and setters (organizar as informações)
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public String getCpf() {
        return cpf;
    }
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    //metodo exibir informações
    public void exibirInformacoes(){
        System.out.println("Nome: " +nome);
        System.out.println("CPF: "+cpf);
    } 
}