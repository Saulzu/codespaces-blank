package sudoku.vista;

import sudoku.modelo.Tablero;
import sudoku.modelo.excepciones.SudokuException;

import javax.swing.*;
import java.awt.*;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

public class SudokuGUI extends JFrame {
    private Tablero tablero;
    private JTextField[][] cajas;

    public SudokuGUI(Tablero tablero) {
        this.tablero = tablero;
        this.cajas = new JTextField[9][9];
        configurarVentana();
        inicializarComponentes();
        actualizarTablero();
    }

    private void configurarVentana() {
        setTitle("Sudoku POO");
        setSize(500, 550);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new BorderLayout());
        setLocationRelativeTo(null);
    }

    private void inicializarComponentes() {
        JPanel panelCuadricula = new JPanel(new GridLayout(9, 9));
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                JTextField caja = new JTextField();
                caja.setHorizontalAlignment(JTextField.CENTER);
                caja.setFont(new Font("Arial", Font.BOLD, 20));
                
                int top = (i % 3 == 0) ? 3 : 1;
                int left = (j % 3 == 0) ? 3 : 1;
                int bottom = (i == 8) ? 3 : 1;
                int right = (j == 8) ? 3 : 1;
                caja.setBorder(BorderFactory.createMatteBorder(top, left, bottom, right, Color.BLACK));
                
                final int fila = i;
                final int col = j;
                
                caja.addKeyListener(new KeyAdapter() {
                    @Override
                    public void keyReleased(KeyEvent e) {
                        manejarEntrada(fila, col, caja.getText());
                    }
                });
                
                cajas[i][j] = caja;
                panelCuadricula.add(caja);
            }
        }
        add(panelCuadricula, BorderLayout.CENTER);

        JPanel panelBotones = new JPanel();
        JButton btnGuardar = new JButton("Guardar");
        JButton btnCargar = new JButton("Cargar");
        
        btnGuardar.addActionListener(e -> {
            try {
                tablero.guardarPartida("sudoku_guardado.txt");
                JOptionPane.showMessageDialog(this, "Partida guardada exitosamente.");
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(this, "Error al guardar: " + ex.getMessage());
            }
        });
        
        btnCargar.addActionListener(e -> {
            try {
                tablero.cargarPartida("sudoku_guardado.txt");
                actualizarTablero();
                JOptionPane.showMessageDialog(this, "Partida cargada.");
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(this, "Error al cargar: " + ex.getMessage());
            }
        });

        panelBotones.add(btnGuardar);
        panelBotones.add(btnCargar);
        add(panelBotones, BorderLayout.SOUTH);
    }

    private void manejarEntrada(int fila, int col, String texto) {
        if (texto.isEmpty()) {
            try { tablero.ingresarValor(fila, col, 0); } catch (Exception ignored) {}
            return;
        }
        try {
            int valor = Integer.parseInt(texto);
            if (valor < 1 || valor > 9) throw new NumberFormatException();
            tablero.ingresarValor(fila, col, valor);
            cajas[fila][col].setForeground(Color.BLUE);
        } catch (SudokuException ex) {
            JOptionPane.showMessageDialog(this, ex.getMessage(), "Movimiento Inválido", JOptionPane.WARNING_MESSAGE);
            actualizarTablero(); // Revierte visualmente
        } catch (NumberFormatException ex) {
            JOptionPane.showMessageDialog(this, "Solo ingresa números del 1 al 9.");
            actualizarTablero();
        }
    }

    private void actualizarTablero() {
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                int valor = tablero.getValor(i, j);
                cajas[i][j].setText(valor == 0 ? "" : String.valueOf(valor));
                cajas[i][j].setEditable(!tablero.esCeldaFija(i, j));
                cajas[i][j].setForeground(tablero.esCeldaFija(i, j) ? Color.BLACK : Color.BLUE);
                if (tablero.esCeldaFija(i, j)) {
                    cajas[i][j].setBackground(Color.LIGHT_GRAY);
                } else {
                    cajas[i][j].setBackground(Color.WHITE);
                }
            }
        }
    }
}