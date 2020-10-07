package com.emergentes.modelo;

public class Curso {
    private int id;
    private String nombre;
    private String apellidos;
    private String curso;

    public Curso(){
        id=0;
        nombre="";
        apellidos="";
        curso="";
    }
            
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }
    
    
}
