/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.uned.msanchez.tfm.git;



import java.io.File;
import java.io.IOException;
import java.util.ResourceBundle;
import org.eclipse.jgit.api.errors.GitAPIException;

/**
 * 
 * @author Mario Pérez Esteso
 *
 */

public class Test {
    
     public static void main(String[] args) throws IOException, GitAPIException {
     
          ResourceBundle rb = ResourceBundle.getBundle("es.uned.msanchez.tfm.resources.wizard");
        String path_base_tmp = rb.getString("path_tmp").trim();
        String localPath = path_base_tmp + File.separator + "tmp"+ File.separator +"git"+ File.separator +"origen";
        System.out.println(localPath);
        String remotePath = "https://github.com/msanchez4853/memory.git";
        GitControl gc = new GitControl(localPath, remotePath);
        //Clone repository
        gc.cloneRepo();
        //Add files to repository
      //  gc.addToRepo();
        //Commit with a custom message
      //  gc.commitToRepo("Modified testfile.txt");
        //Push commits
     //   gc.pushToRepo();
        //Pull
        gc.pullFromRepo();
    }
    
}
