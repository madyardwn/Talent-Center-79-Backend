package com.tujuhsembilan.app.controller;

import com.tujuhsembilan.app.dto.PositionDto;
import com.tujuhsembilan.app.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController // Anotasi ini menandakan bahwa kelas ini adalah controller REST.
@RequestMapping("/api/positions") // Menentukan base path untuk semua endpoint di controller ini.
public class PositionController {

    @Autowired // Memberi tahu Spring Framework bahwa properti ini akan diinjeksikan
               // (autowired).
    private PositionService positionService; // Mendeklarasikan dependensi dari PositionService.

    @GetMapping("/get-all") // Menentukan path dan metode HTTP (GET) untuk endpoint tertentu.
    public List<PositionDto> getMasterPosisiTalent() {
        // Memanggil metode dari PositionService untuk mendapatkan List<PositionDto>.
        return positionService.getMasterPosisiTalent();
    }
}
