import javax.swing.*;
import java.awt.*;
import java.nio.file.*;
public class MiniEditor{
  static Path arquivo;
  public static void main(String[] args){
    SwingUtilities.invokeLater(()->{
      JTextArea area=new JTextArea();
      JFrame f=new JFrame("Mini Editor - Caio Torquato");
      JButton abrir=new JButton("Abrir"),salvar=new JButton("Salvar"),limpar=new JButton("Limpar");
      abrir.addActionListener(e->{JFileChooser j=new JFileChooser();if(j.showOpenDialog(f)==0)try{arquivo=j.getSelectedFile().toPath();area.setText(Files.readString(arquivo));}catch(Exception ex){erro(f,ex);}});
      salvar.addActionListener(e->{try{if(arquivo==null){JFileChooser j=new JFileChooser();if(j.showSaveDialog(f)!=0)return;arquivo=j.getSelectedFile().toPath();}Files.writeString(arquivo,area.getText());}catch(Exception ex){erro(f,ex);}});
      limpar.addActionListener(e->area.setText(""));
      JPanel barra=new JPanel();barra.add(abrir);barra.add(salvar);barra.add(limpar);
      area.setFont(new Font("Monospaced",Font.PLAIN,16));
      f.add(barra,BorderLayout.NORTH);f.add(new JScrollPane(area));
      f.setSize(760,520);f.setLocationRelativeTo(null);f.setDefaultCloseOperation(3);f.setVisible(true);
    });
  }
  static void erro(Component p,Exception e){JOptionPane.showMessageDialog(p,e.getMessage(),"Erro",JOptionPane.ERROR_MESSAGE);}
}
