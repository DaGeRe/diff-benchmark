package de.dagere.diffBenchmark;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.commons.io.FileUtils;
import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.Param;
import org.openjdk.jmh.annotations.Scope;
import org.openjdk.jmh.annotations.State;
import org.openjdk.jmh.infra.Blackhole;

import com.github.difflib.text.DiffRow;
import com.github.difflib.text.DiffRowGenerator;

@State(Scope.Benchmark)
public class DiffBenchmark {

   @Param({ "10000", "50000", "100000", "200000", "300000" })
   public int size;

   @Benchmark
   public void testMethod(Blackhole bh) throws IOException {
      
      File folder = new File(Integer.toString(size));
      
      File[] commitFiles = new File[2];
      commitFiles[0] = new File(folder, "414ae6.txt");
      commitFiles[1] = new File(folder, "afdedc.txt");
      
      DiffRowGenerator diffRowGenerator = DiffRowGenerator.create()
            .build();
      
      List<String> file1text = readLines(commitFiles[0]);
      List<String> file2text = readLines(commitFiles[1]);

      final List<DiffRow> diffRows = diffRowGenerator.generateDiffRows(file1text, file2text);
      bh.consume(diffRows.get(1));
   }

   private List<String> readLines(File commitFile) throws IOException {
      List<String> fileText = FileUtils.readLines(commitFile, StandardCharsets.UTF_8)
            .stream()
            .map(line -> line.trim())
            .collect(Collectors.toList());
      return fileText;
   }

}
