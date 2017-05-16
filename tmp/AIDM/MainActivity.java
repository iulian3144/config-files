package com.example.ipaun1.fileexample;

import android.os.Environment;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class MainActivity extends AppCompatActivity {
    TextView textViewFileContent;
    TextView editTextContent;
    Button btnReadInternalFile, btnReadExternalFile, btnWriteInternalFile, btnWriteExternalFile;

    String fileName = "internal_file.txt";

    File externalFile;

    private String filePath = "xmlFileDir";
    String myData = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        textViewFileContent = (TextView)findViewById(R.id.textViewContent);
        editTextContent = (EditText)findViewById(R.id.editTextContent);

        btnReadInternalFile = (Button)findViewById(R.id.btnReadInternalFile);
        btnReadExternalFile = (Button)findViewById(R.id.btnReadExternalFile);
        btnWriteInternalFile = (Button)findViewById(R.id.btnWriteInternalFile);
        btnWriteExternalFile = (Button)findViewById(R.id.btnWriteExternalFile);

        // if external storage is not writable, disable related buttons
        if(!isExternalStorageWritable()) {
            btnReadExternalFile.setEnabled(false);
            btnWriteExternalFile.setEnabled(false);
        } else {
            externalFile = new File(getExternalFilesDir(filePath), fileName);
            Log.d("FILEEX", externalFile.getAbsolutePath());
        }

        Log.d("FILEEX", getFilesDir().getAbsolutePath());
    }

    // check if external storage is writable
    public boolean isExternalStorageWritable() {
        String state = Environment.getExternalStorageState();

        if(Environment.MEDIA_MOUNTED.equals(state)) {
            Toast.makeText(getApplicationContext(), "External storage is writable", Toast.LENGTH_LONG).show();

            return true;
        }

        return false;
    }

    public void writeInternalFile(View v) {
        try {
            // open a file with the specified name, located in app context
            FileOutputStream outFile = openFileOutput(fileName, MODE_PRIVATE);
            OutputStreamWriter outputWriter = new OutputStreamWriter(outFile);

            outputWriter.write(editTextContent.getText().toString());
            outputWriter.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void readInternalFile(View v) {
        try {
            FileInputStream inFile = openFileInput(fileName);
            DataInputStream in = new DataInputStream(inFile);
            BufferedReader br = new BufferedReader(new InputStreamReader(in));
            String line;
            String readString = "";
            String displayText;

            while((line = br.readLine()) != null) {
                readString += line + "\n";
            }

            in.close();
            displayText = "Internal file content\n" + readString;
            textViewFileContent.setText(displayText);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void writeExternalFile(View v) {
        Log.d("FILEEX", "writeExternalFile");
        try {
            FileOutputStream outputStream = new FileOutputStream(externalFile);
            OutputStreamWriter outputWriter = new OutputStreamWriter(outputStream);

            outputWriter.write(editTextContent.getText().toString());
            outputWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
            editTextContent.setText("");
        }
    }

    public void readExternalFile(View v) {
        Log.d("FILEEX", "readExternalFile");
        String readString = "";
        String displayText;

        try {
            FileInputStream file = new FileInputStream(externalFile);
            DataInputStream in = new DataInputStream(file);
            BufferedReader br = new BufferedReader(new InputStreamReader(in));
            String line;

            while((line = br.readLine()) != null) {
                readString += line + "\n";
            }

            in.close();
            displayText = "External file content\n" + readString;
            textViewFileContent.setText(displayText);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
