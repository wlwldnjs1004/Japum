package com.kh.jagpum.vo;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.jagpum.dao.WorkDao;
import com.kh.jagpum.dto.AttachmentDto;
import com.kh.jagpum.dto.WorkDto;
import com.kh.jagpum.service.AttachmentService;

import lombok.Data;

@Service
public class WorkService {

    @Autowired
    private WorkDao workDao;

    @Autowired
    private AttachmentService attachmentService;
    
    
// 등록 처리
    public void register(WorkDto workDto, String userId, MultipartFile attach) throws IllegalStateException, IOException {
        workDto.setWorkId(userId);
        prepareWorkDays(workDto);

        WorkDto resultDto = workDao.insert2(workDto);

        if (!attach.isEmpty()) {
            AttachmentDto attachmentDto = attachmentService.save(attach);
            workDao.connect(resultDto, attachmentDto);
        }
    }
//날짜 처리
    private void prepareWorkDays(WorkDto dto) {
        dto.setWorkMon(dto.getWorkMon() == null ? "N" : dto.getWorkMon());
        dto.setWorkTue(dto.getWorkTue() == null ? "N" : dto.getWorkTue());
        dto.setWorkWed(dto.getWorkWed() == null ? "N" : dto.getWorkWed());
        dto.setWorkThu(dto.getWorkThu() == null ? "N" : dto.getWorkThu());
        dto.setWorkFri(dto.getWorkFri() == null ? "N" : dto.getWorkFri());
        dto.setWorkSat(dto.getWorkSat() == null ? "N" : dto.getWorkSat());
        dto.setWorkSun(dto.getWorkSun() == null ? "N" : dto.getWorkSun());
    }
//수정 처리
    public void updateWork(WorkDto workDto, MultipartFile attach) throws IOException {
        prepareWorkDays(workDto); // null → "N" 처리

        boolean success = workDao.update(workDto);
        if (!success) {
            throw new RuntimeException("수정 실패"); // 컨트롤러에서 catch 하거나 redirect 처리
        }

        if (attach != null && !attach.isEmpty()) {
            try {
                int attachmentNo = workDao.findAttachment(workDto.getWorkNo());
                attachmentService.delete(attachmentNo);
            } catch (Exception e) {
                // 이전 이미지 없을 수도 있음 → 무시
            }

            AttachmentDto attachmentDto = attachmentService.save(attach);
            workDao.connect(workDto, attachmentDto);
        }
    }



}
