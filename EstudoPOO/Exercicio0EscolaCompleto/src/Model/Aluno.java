package Model;

public class Aluno extends Pessoa implements Avaliavel {
    //atributos
    private String matricula;
    private Double nota;
    //construtor
    public Aluno(String nome, String cpf, String matricula, Double nota) {
        super(nome, cpf);
        this.matricula = matricula;
        this.nota = nota;
    }
    //getter and setters
    public String getMatricula() {
        return matricula;
    }
    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }
    public Double getNota() {
        return nota;
    }
    public void setNota(Double nota) {
        this.nota = nota;
    }
    //exibir informações - SobreEscrita
    @Override
    public void exibirInformacoes(){
        super.exibirInformacoes();
        System.out.println("Matrículo: " +matricula);
        System.out.println("Nota: " +nota);
    }
    //Avaliável
    @Override
    public void avaliarDesempenho() {
      if (nota>=6) {
        System.out.println("Aluno aprovado");
      }else{
        System.out.println("Aluno Repovado");
      }
    }

    
}
